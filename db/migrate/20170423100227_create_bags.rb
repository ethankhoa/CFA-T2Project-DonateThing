class CreateBags < ActiveRecord::Migration[5.0]
  def change
    create_table :bags do |t|
      t.string :item
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
