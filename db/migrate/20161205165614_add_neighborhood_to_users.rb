class AddNeighborhoodToUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :neighborhood, :string
  end

  def down
    remove_column :users, :neighborhood
  end
end
