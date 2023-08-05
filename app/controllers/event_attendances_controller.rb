# frozen_string_literal: true

class EventAttendancesController < ApplicationController
  def new
    @event_attendance = EventAttendance.new
  end

  def create
    @event = Event.find(params[:attended_event_id])

    unless EventAttendance.find_by(attendee_id: current_user.id, attended_event_id: @event.id).nil?
      flash[:notice] = "You're already attending this event!"
      redirect_to event_path(@event.id)
      return
    end

    handle_new_attendance
  end

  private

  def handle_new_attendance
    @event_attendance = EventAttendance.new(attended_event_id: @event.id, attendee_id: current_user.id)
    flash[:notice] = @event_attendance.save ? 'You\'re signed up for the event!' : 'Something went wrong'
    redirect_to event_path(@event.id)
  end
end
