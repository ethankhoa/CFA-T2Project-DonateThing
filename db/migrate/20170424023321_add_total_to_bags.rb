class AddTotalToBags < ActiveRecord::Migration[5.0]
  def change
    add_column :bags, :total_cost, :decimal, precision: 12, scale: 3
  end
end
