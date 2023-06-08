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
class Follow < ApplicationRecord
  # Direct associations

  belongs_to :follower,
             class_name: "User",
             counter_cache: :follows_as_follower_count

  belongs_to :leader,
             class_name: "User",
             counter_cache: :follows_as_leader_count

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    leader.to_s
  end
end
