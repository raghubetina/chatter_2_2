class Post < ApplicationRecord
  # Direct associations

  belongs_to :author,
             :class_name => "User",
             :counter_cache => :own_posts_count

  # Indirect associations

  # Validations

  validates :body, :presence => true

  # Scopes

  def to_s
    body
  end

end
