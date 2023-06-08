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
require "rails_helper"

RSpec.describe Like, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:post) }

    it { should belong_to(:fan) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
