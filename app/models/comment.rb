class Comment < ApplicationRecord
  # Direct associations

  belongs_to :post,
             :counter_cache => true

  belongs_to :commenter,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :body, :presence => true

  # Scopes

  def to_s
    body
  end

end
