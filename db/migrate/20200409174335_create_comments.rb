class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :product_id
      t.text :text, null: false
      t.timestamps
    end
  end
end
