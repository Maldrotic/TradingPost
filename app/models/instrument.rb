class Instrument < ApplicationRecord
  belongs_to :category
  has_many :posts, dependent: :destroy

  validates :name, presence: true
end
