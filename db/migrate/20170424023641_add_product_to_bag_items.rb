class AddProductToBagItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :bag_items, :product, foreign_key: true
    add_column :bag_items, :unit_price, :decimal, precision: 12, scale: 3
    add_column :bag_items, :total_price, :decimal, precision: 12, scale: 3
  end
end
