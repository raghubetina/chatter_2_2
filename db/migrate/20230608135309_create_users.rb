class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.text :bio
      t.string :link
      t.string :location

      t.timestamps
    end
  end
end
