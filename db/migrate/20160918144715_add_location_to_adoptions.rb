class AddLocationToAdoptions < ActiveRecord::Migration[5.0]
  def up
  	add_column :adoptions, :cep, :string
  	add_column :adoptions, :state, :string
  	add_column :adoptions, :adress, :string
  	add_column :adoptions, :city, :string
  	add_column :adoptions, :adress_number, :string

    add_column :users, :city, :string
  end
  
  def down
  	remove_column :adoptions, :cep, :string
  	remove_column :adoptions, :state, :string
  	remove_column :adoptions, :adress, :string
  	remove_column :adoptions, :city, :string
  	remove_column :adoptions, :adress_number, :string

  	remove_column :users, :city, :string
  end
end
