class CommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :commenter_id, :integer
  attribute :post_id, :integer
  attribute :body, :string

  # Direct associations

  belongs_to :post

  belongs_to :commenter,
             resource: UserResource

  # Indirect associations
end
