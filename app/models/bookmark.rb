class Bookmark < ApplicationRecord
  # Direct associations

  belongs_to :post,
             :counter_cache => true

  belongs_to :bookmarker,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    bookmarker.to_s
  end

end
