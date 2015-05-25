class ProjectBuildJob < ActiveJob::Base
  queue_as :default

  def perform build, commit=nil
    init_build build
    init_executer
    init_dir
    init_project build.project, commit
    save_ret build, exec_script(build.project.script)
  end

  private

  def init_build build
    build.state = Build::STATE[:building]
    build.save
  end

  def init_executer
    @rbox = Rye::Box.new('localhost')
    @rbox.cd "/var/tmp/"
  end

  def init_dir
    @rbox.mkdir "DuckCI" unless @rbox.ls.include? "DuckCI"
    @rbox.cd "DuckCI"
  end

  def init_project project, commit=nil
    @rbox.mkdir project.id.to_s unless @rbox.ls.include? project.id.to_s
    @rbox.cd project.id.to_s
    if @rbox.ls(:a).include? ".git"
      @rbox.git("fetch", "origin")
      @rbox.git("rebase", "origin/#{project.branch}")
    else
      @rbox.git("clone", project.uri, ".")
    end
  end

  def exec_script script
    @rbox.sh(:c, script)
  end

  def get_commit_hash
    ret = @rbox.git("log", :n, 1, '--pretty=format:"%H"')
    ret.stdout[0].gsub(/"/, '')
  end

  def save_ret build, ret
    build.commit = get_commit_hash
    build.exit_status = ret.exit_status
    build.stderr = ret.stderr.join("\n" * 4)
    build.stdout = ret.stdout.join("\n" * 4)
    build.state = Build::STATE[:end]
    build.save
  end
end
