# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  body         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  commenter_id :integer          not null
#  post_id      :integer          not null
#
# Indexes
#
#  index_comments_on_commenter_id  (commenter_id)
#  index_comments_on_post_id       (post_id)
#
# Foreign Keys
#
#  commenter_id  (commenter_id => users.id)
#  post_id       (post_id => posts.id)
#
class Comment < ApplicationRecord
  # Direct associations

  belongs_to :post,
             counter_cache: true

  belongs_to :commenter,
             class_name: "User",
             counter_cache: true

  # Indirect associations

  # Validations

  validates :body, presence: true

  # Scopes

  def to_s
    body
  end
end
