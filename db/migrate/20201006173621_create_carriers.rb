class CreateCarriers < ActiveRecord::Migration[6.0]
  def change
    create_table :carriers do |t|
      t.integer :carrier_id
      t.string :company_name
      t.string :company_address_1
      t.string :company_address_2
      t.string :company_city
      t.string :company_state
      t.string :company_zip

      t.timestamps
    end
  end
end
