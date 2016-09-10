class InsertTitleAndDescriptionInAdoptions < ActiveRecord::Migration[5.0]
  def up
  	add_column :adoptions, :title, :string
  	add_column :adoptions, :description, :text
  end

  def down
  	remove_column :adoptions, :title, :string
  	remove_column :adoptions, :description, :text
  end
end
