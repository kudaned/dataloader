class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.integer :client_id
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :division
      t.string :major_group
      t.string :industry_group
      t.string :sic
      t.string :description

      t.timestamps
    end
  end
end
