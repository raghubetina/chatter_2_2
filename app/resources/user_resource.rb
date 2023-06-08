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

  has_many   :bookmarks,
             foreign_key: :bookmarker_id

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

  has_many :leaders_liked_posts, resource: PostResource do
    assign_each do |user, posts|
      posts.select do |p|
        p.id.in?(user.leaders_liked_posts.map(&:id))
      end
    end
  end

  has_many :leaders_bookmarked_posts, resource: PostResource do
    assign_each do |user, posts|
      posts.select do |p|
        p.id.in?(user.leaders_bookmarked_posts.map(&:id))
      end
    end
  end

  has_many :leaders_commented_posts, resource: PostResource do
    assign_each do |user, posts|
      posts.select do |p|
        p.id.in?(user.leaders_commented_posts.map(&:id))
      end
    end
  end


  filter :post_id, :integer do
    eq do |scope, value|
      scope.eager_load(:leaders_commented_posts).where(:comments => {:post_id => value})
    end
  end
end
