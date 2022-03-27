class Tag < ApplicationRecord

  validates :tag_name, uniqueness: true

  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags
end
