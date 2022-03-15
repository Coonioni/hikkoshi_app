class Post < ApplicationRecord
  validates :post_content, :address, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked?(user)
    likes.where(user_id: user.id).exists?
  end
end
