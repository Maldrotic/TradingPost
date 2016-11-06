class Instrument < ApplicationRecord
  validates :name, :type, presence: true
end
