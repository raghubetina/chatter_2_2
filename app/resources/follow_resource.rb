class FollowResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :leader_id, :integer
  attribute :follower_id, :integer

  # Direct associations

  belongs_to :follower,
             resource: UserResource

  belongs_to :leader,
             resource: UserResource

  # Indirect associations
end
