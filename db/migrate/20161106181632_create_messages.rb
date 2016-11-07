class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :text
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :post_id
      t.boolean :is_read, default: false

      t.timestamps
    end
  end
end
