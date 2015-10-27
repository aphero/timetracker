class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new

  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy

  end

  def edit
    @project = Project.find(params[:id])
  end

end
