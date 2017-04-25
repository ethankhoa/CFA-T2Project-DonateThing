class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.references :donation_status, foreign_key: true
      t.references :user, foreign_key: true
      t.references :org, foreign_key: true
      t.references :donation_bag, foreign_key: true

      t.timestamps
    end
  end
end
