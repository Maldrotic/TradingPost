class User < ApplicationRecord

  has_many :posts, dependent: :destroy

  validates :username, :email, presence: true, uniqueness: true
  
  validates :image_url, format: {
    with:    %r{(^$|\.(gif|jpg|png))\z}i,
    message: 'must be a URL for GIF, JPG, or PNG image.'
  }

  has_secure_password

end
