class AddLocationToUserAndAdoption < ActiveRecord::Migration[5.0]
  def up
  	add_column :users, :location_id, :integer
  	add_column :adoptions, :location_id, :integer
  end

  def down
  	remove_column :users, :location_id, :integer
  	remove_column :adoptions, :location_id, :integer
  end
end
