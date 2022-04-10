class PostTag < ApplicationRecord
  validates :tag_id, :post_id, uniqueness: true
  
  belongs_to :post
  belongs_to :tag
end
