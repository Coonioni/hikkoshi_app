class Post < ApplicationRecord
  validates :post_content, :address, presence: true
  belongs_to :user
  has_many :comments,       dependent: :destroy
  has_many :likes,          dependent: :destroy
  has_many :notifications,  dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags


  def liked?(user)
    likes.where(user_id: user.id).exists?
  end

  def create_notification_like(current_user)
    notification = current_user.active_notifications.new(
      post_id: id,
      visited_id: user_id,
      action: 'like'
    )
    notification.save if notification.valid?
  end

  def create_notification_comment(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
      temp_ids.each do |temp_id|
        save_notification_comment(current_user, comment_id, temp_id['user_id'])
      end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment(current_user, comment_id, visited_id)
    notification = current_user.active_notifications.new(
      post_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    notification.checked = true if notification.visitor_id == notification.visited_id
    notification.save if notification.valid?
  end

end
