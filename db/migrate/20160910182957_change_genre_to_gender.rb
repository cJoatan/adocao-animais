class ChangeGenreToGender < ActiveRecord::Migration[5.0]
  def up
  	rename_column :users, :genre, :gender
  end

  def down
  	rename_column :users, :gender, :genre
  end
end
