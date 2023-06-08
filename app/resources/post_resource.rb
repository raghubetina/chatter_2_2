class PostResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :body, :string
  attribute :author_id, :integer

  # Direct associations

  has_many   :bookmarks

  has_many   :likes

  has_many   :comments

  belongs_to :author,
             resource: UserResource

  # Indirect associations

  has_many :fans_followers, resource: UserResource do
    assign_each do |post, users|
      users.select do |u|
        u.id.in?(post.fans_followers.map(&:id))
      end
    end
  end

  has_many :bookmarkers_followers, resource: UserResource do
    assign_each do |post, users|
      users.select do |u|
        u.id.in?(post.bookmarkers_followers.map(&:id))
      end
    end
  end

  has_many :commenters_followers, resource: UserResource do
    assign_each do |post, users|
      users.select do |u|
        u.id.in?(post.commenters_followers.map(&:id))
      end
    end
  end


  filter :follower_id, :integer do
    eq do |scope, value|
      scope.eager_load(:commenters_followers).where(:follows => {:follower_id => value})
    end
  end

  filter :follower_id, :integer do
    eq do |scope, value|
      scope.eager_load(:bookmarkers_followers).where(:follows => {:follower_id => value})
    end
  end

  filter :follower_id, :integer do
    eq do |scope, value|
      scope.eager_load(:fans_followers).where(:follows => {:follower_id => value})
    end
  end
end
