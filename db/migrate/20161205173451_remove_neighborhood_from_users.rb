class RemoveNeighborhoodFromUsers < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :neighborhood
  end

  def down
    add_column :users, :neighborhood, :string
  end
end
