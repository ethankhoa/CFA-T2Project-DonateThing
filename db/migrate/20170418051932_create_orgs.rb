class CreateOrgs < ActiveRecord::Migration[5.0]
  def change
    create_table :orgs do |t|
      t.string :name
      t.string :org_type
      t.string :phone
      t.string :website
      t.string :logo
      t.json :images
      t.references :user, foreign_key: true
      t.string :googleplaceid

      t.timestamps
    end
  end
end
