class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.string :burden, null: false
      t.string :method, null: false
      t.string :area, null: false
      t.string :estimated, null: false
      t.timestamps
    end
  end
end
