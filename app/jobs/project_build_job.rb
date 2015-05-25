class ProjectBuildJob < ActiveJob::Base
  queue_as :default

  def perform build, commit=nil
    init_executer
    init_dir
    init_project build.project, commit
    ret = exec_script build.project.script
    build.output = ret.stdout
    build.save
  end

  private

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
end
