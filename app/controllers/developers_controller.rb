class DevelopersController < ApplicationController
  before_action :set_developer, only: [:show, :edit, :update, :destroy]

  def index
    @developers = Developer.all
  end

  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.new
    if @developer.save
      redirect_to @developer, notice: 'Developer was successfully created.'
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    if @developer.time_entries.blank?
      @developer.destroy
      redirect_to developers_path, notice: 'Developer was successfully destroyed.'
    else
      redirect_to developers_path, notice: 'Cannot delete a Developer that is currently working on Projects.'
    end
  end

  def edit
  end

  def update
    if @developer.update(developer_params)
      redirect_to @developer, notice: 'Developer was successfully updated.'
    else
      render :edit
    end
  end

  private

    def developer_params
      params.require(:developer).permit(:date, :duration, :developer_id, :developer_id)
    end

    def set_developer
      @developer = Developer.find(params[:id])
    end
end
