class AddStreetAndCityAndStateToUser < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
  end

  def down
    remove_column :users, :street
    remove_column :users, :city
    remove_column :users, :state
  end
end
