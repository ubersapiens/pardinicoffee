class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_street_address
      t.string :email
      t.integer :coffee_method_used
      t.integer :coffee_grind

      t.timestamps null: false
    end
  end
end
