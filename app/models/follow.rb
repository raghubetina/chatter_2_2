class Follow < ApplicationRecord
  # Direct associations

  belongs_to :follower,
             :class_name => "User",
             :counter_cache => :follows_as_follower_count

  belongs_to :leader,
             :class_name => "User",
             :counter_cache => :follows_as_leader_count

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    leader.to_s
  end

end
