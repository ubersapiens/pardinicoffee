class AddCoffeeSelectedToClients < ActiveRecord::Migration
  def change
    add_column :clients, :coffee_selected, :string
  end
end
