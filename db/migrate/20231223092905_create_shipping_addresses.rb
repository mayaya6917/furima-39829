class CreateShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_addresses do |t|
      t.references :order, null: false, foreign_key: true
      t.string :post_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :adresses, null: false
      t.string :building
      t.string :phone_number, null: false
      t.timestamps
    end
  end
end
