class AddBookmarkCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bookmarks_count, :integer
  end
end
