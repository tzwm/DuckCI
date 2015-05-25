class BuildsController < ApplicationController
  def create
    load_project
    build_build
    save_build
    redirect_to @project
  end

  def destroy
    load_build
    load_project
    @build.destroy
    redirect_to @project
  end

  private

  def load_build
    @build ||= Build.find(params[:id])
  end

  def load_project
    @project ||= @build.project unless @build.blank?
    @project ||= Project.find(params[:project_id])
  end

  def build_build
    @build = Build.new
    @build.project_id = @project.id
    @build.commit = "test"
    @build.state = "wait"
  end

  def save_build
    @build.save
    ProjectBuildJob.perform_later @build
  end
end
