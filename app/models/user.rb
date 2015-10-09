class User < ActiveRecord::Base
  has_many :user_events
  has_many :events, through: :user_events
  has_many :points, foreign_key: :sender_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :image, ImageUploader
  after_create :add_karma

  def add_karma
    self.giveable_karma = 10
    self.save
  end

end
