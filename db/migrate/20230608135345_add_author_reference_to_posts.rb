class AddAuthorReferenceToPosts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :posts, :users, column: :author_id
    add_index :posts, :author_id
    change_column_null :posts, :author_id, false
  end
end
