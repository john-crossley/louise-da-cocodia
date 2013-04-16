class EventsController < ApplicationController

  before_filter :authenticate, only: [:new, :create, :edit, :update]

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      flash[:success] = "Success, your event has been updated."
      redirect_to root_path
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      flash[:success] = "Success, the event has been removed."
      redirect_to root_url
    end
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      flash[:success] = "Success, the event has been created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

end