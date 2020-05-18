class CreateCompraUnidades < ActiveRecord::Migration
  def change
    create_table :compra_unidades do |t|
      t.references :compra
      t.string     :purchaser_name
      t.string     :item_description
      t.float      :item_price
      t.integer    :purchase_count 
      t.string     :merchant_address
      t.string     :merchant_name
      t.timestamps null: false
    end
  end
end
