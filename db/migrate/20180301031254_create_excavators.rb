class CreateExcavators < ActiveRecord::Migration[5.1]
  def change
    create_table :excavators do |t|
      t.string :company_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.boolean :crew_on_site
      t.references :ticket, index: true

      t.timestamps
    end
  end
end
