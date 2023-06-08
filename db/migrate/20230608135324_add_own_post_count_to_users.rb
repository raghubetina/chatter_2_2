class AddOwnPostCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :own_posts_count, :integer
  end
end
