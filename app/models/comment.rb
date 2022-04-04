class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :notifications, dependent: :destroy

  validates :user_id, :post_id, uniqueness: true
  validates :content, presence: true, length: { maximum: 170 }
end
