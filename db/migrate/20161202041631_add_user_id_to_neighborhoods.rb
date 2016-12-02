class AddUserIdToNeighborhoods < ActiveRecord::Migration[5.0]
  def change
    add_column :neighborhoods, :user_id, :integer
  end
end
