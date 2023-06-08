class AddPostReferenceToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bookmarks, :posts
    add_index :bookmarks, :post_id
    change_column_null :bookmarks, :post_id, false
  end
end
