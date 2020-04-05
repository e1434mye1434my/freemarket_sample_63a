class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name,            null: false
      t.integer :stock          
      t.integer :price,          null: false
      t.string :condition,       null: false
      t.string :size            
      t.string :brand
      t.text :introduction,      null: false
      t.string :sales_status    
      t.string :burden, null: false
      t.string :method          
      t.integer :prefecture_id,  null: false
      t.string :estimated, null: false
      t.integer :saler_id
      t.integer :buyer_id
      t.timestamps
    end
  end
end
