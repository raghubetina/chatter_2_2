# == Schema Information
#
# Table name: follows
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  follower_id :integer          not null
#  leader_id   :integer          not null
#
# Indexes
#
#  index_follows_on_follower_id  (follower_id)
#  index_follows_on_leader_id    (leader_id)
#
# Foreign Keys
#
#  follower_id  (follower_id => users.id)
#  leader_id    (leader_id => users.id)
#
require "rails_helper"

RSpec.describe Follow, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:follower) }

    it { should belong_to(:leader) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
