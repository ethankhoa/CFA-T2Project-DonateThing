class CreateBagStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :bag_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
