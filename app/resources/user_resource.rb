class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string
  attribute :name, :string
  attribute :bio, :string
  attribute :link, :string
  attribute :location, :string

  # Direct associations

  has_many   :follows_as_leader,
             resource: FollowResource,
             foreign_key: :leader_id

  # Indirect associations

end
