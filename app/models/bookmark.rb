# == Schema Information
#
# Table name: bookmarks
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  bookmarker_id :integer          not null
#  post_id       :integer          not null
#
# Indexes
#
#  index_bookmarks_on_bookmarker_id  (bookmarker_id)
#  index_bookmarks_on_post_id        (post_id)
#
# Foreign Keys
#
#  bookmarker_id  (bookmarker_id => users.id)
#  post_id        (post_id => posts.id)
#
class Bookmark < ApplicationRecord
  # Direct associations

  belongs_to :post,
             counter_cache: true

  belongs_to :bookmarker,
             class_name: "User",
             counter_cache: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    bookmarker.to_s
  end
end
