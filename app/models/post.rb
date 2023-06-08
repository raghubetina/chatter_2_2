# == Schema Information
#
# Table name: posts
#
#  id              :integer          not null, primary key
#  body            :text
#  bookmarks_count :integer
#  comments_count  :integer
#  likes_count     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  author_id       :integer          not null
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#
# Foreign Keys
#
#  author_id  (author_id => users.id)
#
class Post < ApplicationRecord
  # Direct associations

  has_many   :bookmarks,
             dependent: :destroy

  has_many   :likes,
             dependent: :destroy

  has_many   :comments,
             dependent: :destroy

  belongs_to :author,
             class_name: "User",
             counter_cache: :own_posts_count

  # Indirect associations

  has_many   :commenters,
             through: :comments,
             source: :commenter

  has_many   :fans,
             through: :likes,
             source: :fan

  has_many   :bookmarkers,
             through: :bookmarks,
             source: :bookmarker

  has_many   :author_followers,
             through: :author,
             source: :followers

  has_many   :fans_followers,
             through: :fans,
             source: :followers

  has_many   :bookmarkers_followers,
             through: :bookmarkers,
             source: :followers

  has_many   :commenters_followers,
             through: :commenters,
             source: :followers

  # Validations

  validates :body,
    presence: true,
    length: { maximum: 280 }

  # Scopes

  def to_s
    body
  end
end
