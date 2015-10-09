class Event < ActiveRecord::Base
  has_many :user_events
  has_many :users, through: :user_events
  has_many :points
  belongs_to :host, :foreign_key => :host_id, :class_name => 'User'
end
