class Post < ApplicationRecord
  validates :post_content, :address, presence: true
end
