class Post < ApplicationRecord
  validates :post_content, :address, presence: true

  belongs_to :user
  has_many :comments
end
