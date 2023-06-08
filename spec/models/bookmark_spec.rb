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
require "rails_helper"

RSpec.describe Bookmark, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:post) }

    it { should belong_to(:bookmarker) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
