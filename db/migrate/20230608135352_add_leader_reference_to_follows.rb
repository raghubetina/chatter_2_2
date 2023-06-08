class AddLeaderReferenceToFollows < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :follows, :users, column: :leader_id
    add_index :follows, :leader_id
    change_column_null :follows, :leader_id, false
  end
end
