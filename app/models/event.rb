# frozen_string_literal: true

# Event class
class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendances, source: :attendee

  def self.past
    where('date < ?', Date.today)
  end

  def self.upcoming
    where('date >= ?', Date.today)
  end
end
