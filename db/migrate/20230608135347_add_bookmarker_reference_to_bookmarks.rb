class AddBookmarkerReferenceToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bookmarks, :users, column: :bookmarker_id
    add_index :bookmarks, :bookmarker_id
    change_column_null :bookmarks, :bookmarker_id, false
  end
end
