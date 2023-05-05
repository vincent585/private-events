# frozen_string_literal: true

# controller responsible for the handling of events
class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def create; end
end
