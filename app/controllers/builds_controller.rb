class BuildsController < ApplicationController
  def create
    load_project
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
end
