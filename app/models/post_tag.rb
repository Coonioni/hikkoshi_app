class PostTag < ApplicationRecord
  validates :tag_id, :post_id, uniqueness: true
end
