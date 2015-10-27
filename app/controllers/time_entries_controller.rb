class TimeEntriesController < ApplicationController
  before_action :set_time_entry, only: [:show, :edit, :update, :destroy]

  def index
    @time_entries = TimeEntry.all
  end

  def new
    @time_entry = TimeEntry.new
  end

  def create
    @time_entry = TimeEntry.new
    if @time_entry.save
      redirect_to @time_entry, notice: 'Time Entry was successfully created.'
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    @time_entry.destroy
    redirect_to time_entries_path, notice: 'Time Entry was successfully destroyed.'
  end

  def edit
  end

  def update
    if @time_entry.update
      redirect_to @time_entry, notice: 'Time Entry was successfully updated.'
    else
      render 'new'
    end
  end

  private

    def time_entry_params
      params.require(:time_entry).permit(:date, :duration, :developer_id, :project_id)
    end

    def set_time_entry
      @time_entry = TimeEntry.find(params[:id])
    end

end
