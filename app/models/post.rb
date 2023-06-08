class Post < ApplicationRecord
  # Direct associations

  has_many   :bookmarks,
             :dependent => :destroy

  has_many   :likes,
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  belongs_to :author,
             :class_name => "User",
             :counter_cache => :own_posts_count

  # Indirect associations

  has_many   :commenters_followers,
             :through => :commenters,
             :source => :followers

  # Validations

  validates :body, :presence => true

  # Scopes

  def to_s
    body
  end

end
