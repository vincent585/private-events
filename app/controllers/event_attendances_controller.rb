class EventAttendancesController < ApplicationController
  def new
    @event_attendance = EventAttendance.new
  end

  def create
    @event = Event.find(params[:attended_event_id])

    unless EventAttendance.find_by(attendee_id: current_user.id, attended_event_id: @event.id).nil?
      flash[:notice] = "You're already attending this event!"
      redirect_to event_path(@event.id)
    end

    @event_attendance = EventAttendance.new(attended_event_id: @event.id, attendee_id: current_user.id)
    if @event_attendance.save
      flash[:notice] = "You're signed up for the event!"

      redirect_to event_path(@event.id)
    else
      flash[:notice] = "Something went wrong"

      redirect_to event_path(@event.id)
    end
  end
end
