class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.integer :price
      t.integer :user_id
      t.integer :instrument_id

      t.timestamps
    end
  end
end
