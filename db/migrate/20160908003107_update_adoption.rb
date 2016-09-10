class UpdateAdoption < ActiveRecord::Migration[5.0]
  def up
  	rename_column :adoptions, :animal_type, :animal_id
  	add_column :adoptions, :breed_id, :integer
  end

  def down
  	rename_column :adoptions, :animal_id, :animal_type
  	remove_column :adoptions, :breed_id, :integer
  end
end
