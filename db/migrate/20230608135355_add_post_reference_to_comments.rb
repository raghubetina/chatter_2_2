class AddPostReferenceToComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :comments, :posts
    add_index :comments, :post_id
    change_column_null :comments, :post_id, false
  end
end
