# frozen_string_literal: true

# Event class
class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
end
