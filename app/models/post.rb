class Post < ApplicationRecord
  belongs_to :user
  belongs_to :instrument
  has_many :messages, dependent: :destroy

  validates :title, :description, :image_url, :price, :user_id, :instrument_id, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :image_url, format: {
    with:    %r{\.(gif|jpg|png)\z}i,
    message: 'must be a URL for GIF, JPG, or PNG image.'
  }
end
