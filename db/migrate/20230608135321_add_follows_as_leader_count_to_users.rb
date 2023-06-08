class AddFollowsAsLeaderCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :follows_as_leader_count, :integer
  end
end
