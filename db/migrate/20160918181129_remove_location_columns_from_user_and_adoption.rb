class RemoveLocationColumnsFromUserAndAdoption < ActiveRecord::Migration[5.0]
  def up
  	remove_column :users, :state
  	remove_column :users, :adress
  	remove_column :users, :city
  	remove_column :users, :adress_number

  	remove_column :adoptions, :cep
  	remove_column :adoptions, :state
  	remove_column :adoptions, :adress
  	remove_column :adoptions, :city
  	remove_column :adoptions, :adress_number
  end

  def down
  	add_column :users, :state
  	add_column :users, :adress
  	add_column :users, :city
  	add_column :users, :adress_number

  	add_column :adoptions, :cep
  	add_column :adoptions, :state
  	add_column :adoptions, :adress
  	add_column :adoptions, :city
  	add_column :adoptions, :adress_number
  end
end
