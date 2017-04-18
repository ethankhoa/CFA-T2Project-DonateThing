class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :line_1
      t.string :line_2
      t.string :city
      t.string :state
      t.string :postcode
      t.string :country
      t.string :telephone
      t.references :user, foreign_key: true
      t.references :org, foreign_key: true

      t.timestamps
    end
  end
end
