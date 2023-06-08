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
require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:post) }

    it { should belong_to(:commenter) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:body) }
  end
end
