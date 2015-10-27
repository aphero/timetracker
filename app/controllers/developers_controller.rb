class DevelopersController < ApplicationController

  def index
    @developers = Developer.all
  end

  def new

  end

  def show
    @developer = Developer.find(params[:id])
  end

  def destroy

  end

  def edit
    @developer = Developer.find(params[:id])
  end

end
