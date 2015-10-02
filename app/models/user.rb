class User < ActiveRecord::Base
  include Petitionable
  has_many :user_events
  has_many :events, through: :user_events
  has_many :points, foreign_key: :sender_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
