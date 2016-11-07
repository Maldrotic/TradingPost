class Message < ApplicationRecord
  belongs_to :sender, :class_name => 'User'
  belongs_to :receiver, :class_name => 'User'
  belongs_to :post

  validates :text, :sender_id, :receiver_id, :post_id, presence: true

end
