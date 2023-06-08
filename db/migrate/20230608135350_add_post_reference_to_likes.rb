class AddPostReferenceToLikes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :likes, :posts
    add_index :likes, :post_id
    change_column_null :likes, :post_id, false
  end
end
