class Tag < ApplicationRecord

  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags

  validates :tag_name, uniqueness: { case_sensitive: true },
                        presence: true,
                        length: { maximum: 15 },
                        length: { minimum: 1 }

end
