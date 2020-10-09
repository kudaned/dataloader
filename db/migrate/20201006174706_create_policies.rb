class CreatePolicies < ActiveRecord::Migration[6.0]
  def change
    create_table :policies do |t|
      t.string :policy_type
      t.string :division
      t.integer :carrier_id
      t.integer :client_id
      t.string :effective_date
      t.string :expiration_date
      t.string :written_preminum
      t.string :carrier_policy_number
      t.boolean :expiring

      t.timestamps
    end
  end
end
