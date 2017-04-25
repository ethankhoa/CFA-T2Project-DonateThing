class AddStatusToBags < ActiveRecord::Migration[5.0]
  def change
    add_reference :bags, :bag_status, foreign_key: true
    add_column :bags, :total_items, :integer
  end
end
