class LikeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :fan_id, :integer
  attribute :post_id, :integer

  # Direct associations

  belongs_to :post

  belongs_to :fan,
             resource: UserResource

  # Indirect associations
end
