class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    load_projects
  end

  def show
    load_project
    load_builds
  end

  def new
    build_project
  end

  def create
    build_project
    save_project or render :new
  end

  def edit
   load_project
   build_project
  end

  def update
    load_project
    build_project
    save_project or render :edit
  end

  def destroy
    load_project
    @project.destroy
    redirect_to projects_path
  end

  private

  def load_projects
    @projects ||= Project.all
  end

  def load_project
    @project ||= Project.find(params[:id])
  end

  def load_builds
    @builds = @project.builds
  end

  def build_project
    @project ||= Project.new
    @project.attributes = project_params
  end

  def save_project
    if @project.save
      redirect_to @project
    end
  end

  def project_params
    project_params = params[:project]
    project_params ? project_params.permit(:name, :uri, :branch, :script) : {}
  end
end
