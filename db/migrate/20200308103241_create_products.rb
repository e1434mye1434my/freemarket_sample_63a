class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name,            null: false
      t.integer :stock,          null: false
      t.integer :price,          null: false
      t.string :condition,       null: false
      t.string :size,            null: false
      t.text :introduction,      null: false
      t.string :sales_status,    null: false

      t.timestamps
    end
  end
end
