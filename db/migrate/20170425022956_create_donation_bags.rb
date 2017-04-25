class CreateDonationBags < ActiveRecord::Migration[5.0]
  def change
    create_table :donation_bags do |t|
      t.references :user, foreign_key: true
      t.references :bag_status, foreign_key: true
      t.integer :total_quantity

      t.timestamps
    end
  end
end
