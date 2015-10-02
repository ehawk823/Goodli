class Event < ActiveRecord::Base
  include Organizable
  has_many :user_events
  has_many :users, through: :user_events
  has_many :points
end
