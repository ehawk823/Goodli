class Point < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  belongs_to :sender, :foreign_key => :sender_id, :class_name => 'User'
  belongs_to :receiver, :foreign_key => :receiver_id, :class_name => 'User'
  validate :sender_must_have_giveable_karma

  def sender_must_have_giveable_karma
    if self.sender.giveable_karma == 0
      errors.add(:sender, "must have karma to give")
    end
  end

end
