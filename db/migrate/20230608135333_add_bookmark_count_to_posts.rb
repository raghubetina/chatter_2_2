class AddBookmarkCountToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :bookmarks_count, :integer
  end
end
