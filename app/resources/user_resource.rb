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

  has_many   :likes,
             foreign_key: :fan_id

  has_many   :comments,
             foreign_key: :commenter_id

  has_many   :own_posts,
             resource: PostResource,
             foreign_key: :author_id

  has_many   :follows_as_follower,
             resource: FollowResource,
             foreign_key: :follower_id

  has_many   :follows_as_leader,
             resource: FollowResource,
             foreign_key: :leader_id

  # Indirect associations

end
