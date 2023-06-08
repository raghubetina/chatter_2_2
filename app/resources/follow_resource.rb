class FollowResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :leader_id, :integer
  attribute :follower_id, :integer

  # Direct associations

  # Indirect associations

end
