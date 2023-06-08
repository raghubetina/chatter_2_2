class AddFollowerReferenceToFollows < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :follows, :users, column: :follower_id
    add_index :follows, :follower_id
    change_column_null :follows, :follower_id, false
  end
end
