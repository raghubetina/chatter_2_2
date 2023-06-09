# == Schema Information
#
# Table name: users
#
#  id                        :integer          not null, primary key
#  bio                       :text
#  bookmarks_count           :integer
#  comments_count            :integer
#  email                     :string           default(""), not null
#  encrypted_password        :string           default(""), not null
#  follows_as_follower_count :integer
#  follows_as_leader_count   :integer
#  likes_count               :integer
#  link                      :string
#  location                  :string
#  name                      :string
#  own_posts_count           :integer
#  remember_created_at       :datetime
#  reset_password_sent_at    :datetime
#  reset_password_token      :string
#  username                  :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :bookmarks,
             foreign_key: "bookmarker_id",
             dependent: :destroy

  has_many   :likes,
             foreign_key: "fan_id",
             dependent: :destroy

  has_many   :comments,
             foreign_key: "commenter_id",
             dependent: :destroy

  has_many   :own_posts,
             class_name: "Post",
             foreign_key: "author_id",
             dependent: :destroy

  has_many   :follows_as_follower,
             class_name: "Follow",
             foreign_key: "follower_id",
             dependent: :destroy

  has_many   :follows_as_leader,
             class_name: "Follow",
             foreign_key: "leader_id",
             dependent: :destroy

  # Indirect associations

  has_many   :followers,
             through: :follows_as_leader,
             source: :follower

  has_many   :leaders,
             through: :follows_as_follower,
             source: :leader

  has_many   :commented_posts,
             through: :comments,
             source: :post

  has_many   :liked_posts,
             through: :likes,
             source: :post

  has_many   :bookmarked_posts,
             through: :bookmarks,
             source: :post

  has_many   :leaders_own_posts,
             through: :leaders,
             source: :own_posts

  has_many   :leaders_liked_posts,
             through: :leaders,
             source: :liked_posts

  has_many   :leaders_bookmarked_posts,
             through: :leaders,
             source: :bookmarked_posts

  has_many   :leaders_commented_posts,
             through: :leaders,
             source: :commented_posts

  # Validations

  validates :username,
    uniqueness: { case_sensitive: false },
    presence: true,
    length: { maximum: 15},
    format: { with: /\A[A-Za-z0-9_]+\z/, message: "can only contain letters, numbers, and underscores" }

  validates :bio, length: { maximum: 280 }, allow_blank: true
  
  # Scopes

  def to_s
    username
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
