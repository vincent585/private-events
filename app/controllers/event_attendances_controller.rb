class EventAttendancesController < ApplicationController
  def new
    @event_attendance = EventAttendance.new
  end

  def create
    # TODO - add code for creating an event attendance, i.e. an attended event and attendee
  end
end
