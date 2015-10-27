class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new
    if @project.save
      redirect_to project_path(@project.id), notice: 'Project was successfully created.'
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update(student_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @project.time_entries.blank?
      @project.destroy
      redirect_to projects_path, notice: 'Project was successfully destroyed.'
    else
      redirect_to projects_path, notice: 'Cannot delete a Project that is in progress.'
    end
  end


  private

    def project_params
      params.require(:project).permit(:name, :desc, :max_hours)
    end

    def set_project
      @project = Project.find(params[:id])
    end

end
