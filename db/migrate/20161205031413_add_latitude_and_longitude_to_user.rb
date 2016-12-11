class AddLatitudeAndLongitudeToUser < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
  def down
    add_column :users, :latitude 
    add_column :users, :longitude
  end
end
