class AddFollowsAsFollowerCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :follows_as_follower_count, :integer
  end
end
