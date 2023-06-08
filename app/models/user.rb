class User < ApplicationRecord
  
  include JwtToken
# Direct associations

  has_many   :bookmarks,
             :foreign_key => "bookmarker_id",
             :dependent => :destroy

  has_many   :likes,
             :foreign_key => "fan_id",
             :dependent => :destroy

  has_many   :comments,
             :foreign_key => "commenter_id",
             :dependent => :destroy

  has_many   :own_posts,
             :class_name => "Post",
             :foreign_key => "author_id",
             :dependent => :destroy

  has_many   :follows_as_follower,
             :class_name => "Follow",
             :foreign_key => "follower_id",
             :dependent => :destroy

  has_many   :follows_as_leader,
             :class_name => "Follow",
             :foreign_key => "leader_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :followers,
             :through => :follows_as_leader,
             :source => :follower

  has_many   :leaders,
             :through => :follows_as_follower,
             :source => :leader

  has_many   :commented_posts,
             :through => :comments,
             :source => :post

  has_many   :liked_posts,
             :through => :likes,
             :source => :post

  has_many   :bookmarked_posts,
             :through => :bookmarks,
             :source => :post

  has_many   :leaders_own_posts,
             :through => :leaders,
             :source => :own_posts

  has_many   :leaders_liked_posts,
             :through => :leaders,
             :source => :liked_posts

  has_many   :leaders_bookmarked_posts,
             :through => :leaders,
             :source => :bookmarked_posts

  has_many   :leaders_commented_posts,
             :through => :leaders,
             :source => :commented_posts

  # Validations

  validates :username, :uniqueness => true

  validates :username, :presence => true

  # Scopes

  def to_s
    username
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
