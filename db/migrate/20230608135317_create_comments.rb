class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :commenter_id
      t.integer :post_id
      t.text :body

      t.timestamps
    end
  end
end
