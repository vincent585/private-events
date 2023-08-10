# frozen_string_literal: true

# controller responsible for the handling of events
class EventsController < ApplicationController
  before_action :require_permission, only: %i[edit destroy]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to event_path(@event.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    flash[:notice] = 'Event successfully deleted'
    redirect_to root_path, status: :see_other
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def event_params
    params.require(:event).permit(:name, :description, :location, :date, :time, :creator_id)
  end

  def require_permission
    redirect_to root_path if current_user != Event.find(params[:id]).creator
  end
end
