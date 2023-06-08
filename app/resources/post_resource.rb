class PostResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :body, :string
  attribute :author_id, :integer

  # Direct associations

  has_many   :likes

  has_many   :comments

  belongs_to :author,
             resource: UserResource

  # Indirect associations

end
