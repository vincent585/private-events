class EventAttendancesController < ApplicationController
  def new
    @event_attendance = EventAttendance.new
  end

  def create
    @event = Event.find(params[:attended_event_id])
    @event_attendance = EventAttendance.new(attended_event_id: @event.id, attendee_id: current_user.id)

    if @event_attendance.save
      flash[:notice] = "You're signed up for the event!"
    else
      flash[:notice] = "Something went wrong"
    end
  end
end
