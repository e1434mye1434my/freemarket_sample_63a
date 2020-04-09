class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name,            null: false
      t.integer :stock
      t.integer :price,          null: false
      t.integer :condition_id,       null: false
      t.string :size
      t.string :brand
      t.text :introduction,      null: false
      t.string :sales_status
      t.integer :burden_id, null: false
      t.string :method
      t.integer :prefecture_id,  null: false
      t.integer :estimated_id, null: false
      t.integer :saler_id
      t.integer :buyer_id
      t.timestamps
    end
  end
end
