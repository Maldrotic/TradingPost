class Post < ApplicationRecord
  belongs_to :user

  validates :title, :description, :image_url, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :image_url, format: {
    with:    %r{\.(gif|jpg|png)\z}i,
    message: 'must be a URL for GIF, JPG, or PNG image.'
  }
end
