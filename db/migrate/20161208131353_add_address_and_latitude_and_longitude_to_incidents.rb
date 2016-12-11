class AddAddressAndLatitudeAndLongitudeToIncidents < ActiveRecord::Migration[5.0]
  def up
    add_column :incidents, :address, :string
    add_column :incidents, :latitude, :float
    add_column :incidents, :longitude, :float
  end

  def down
    remove_column :incidents, :address
    remove_column :incidents, :latitude
    remove_column :incidents, :longitude
  end

end
