class AddItemReferenceToDonationBags < ActiveRecord::Migration[5.0]
  def change
    add_reference :donation_bags, :bag_item, foreign_key: true
  end
end
