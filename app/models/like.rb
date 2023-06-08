# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fan_id     :integer          not null
#  post_id    :integer          not null
#
# Indexes
#
#  index_likes_on_fan_id   (fan_id)
#  index_likes_on_post_id  (post_id)
#
# Foreign Keys
#
#  fan_id   (fan_id => users.id)
#  post_id  (post_id => posts.id)
#
class Like < ApplicationRecord
  # Direct associations

  belongs_to :post,
             counter_cache: true

  belongs_to :fan,
             class_name: "User",
             counter_cache: true

  # Indirect associations

  # Validations

  validates :user_id,
    uniqueness: { 
      scope: :post_id,
      message: "has already liked this post"
    }

  # Scopes

  def to_s
    fan.to_s
  end
end
