class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.integer :leader_id
      t.integer :follower_id

      t.timestamps
    end
  end
end
