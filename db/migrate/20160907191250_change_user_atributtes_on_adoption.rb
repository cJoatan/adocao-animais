class ChangeUserAtributtesOnAdoption < ActiveRecord::Migration[5.0]
  def up
  	rename_column :adoptions, :user_creator, :user_creator_id
  	rename_column :adoptions, :user_adopted, :user_adopted_id
  end

  def down
  	rename_column :adoptions, :user_creator_id, :user_creator
  	rename_column :adoptions, :user_adopted_id, :user_adopted
  end
end
