class AddNeighborhoodIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :neighborhood
    remove_column :neighborhoods, :user_id
  end
end
