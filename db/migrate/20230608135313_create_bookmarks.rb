class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.integer :bookmarker_id
      t.integer :post_id

      t.timestamps
    end
  end
end
