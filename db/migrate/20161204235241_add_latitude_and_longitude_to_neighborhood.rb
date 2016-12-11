class AddLatitudeAndLongitudeToNeighborhood < ActiveRecord::Migration[5.0]

  def up
    add_column :neighborhoods, :latitude, :float
    add_column :neighborhoods, :longitude, :float
  end

  def down
    add_column :neighborhoods, :latitude
    add_column :neighborhoods, :longitude
  end
end
