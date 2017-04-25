class AddNewReferenceToBagItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :bag_items, :donation_bag, foreign_key: true
    remove_reference :bag_items, :bag, foreign_key: true
  end
end
