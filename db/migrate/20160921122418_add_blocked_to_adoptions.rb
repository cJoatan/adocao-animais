class AddBlockedToAdoptions < ActiveRecord::Migration[5.0]
  def change
    add_column :adoptions, :blocked, :boolean, default: false
  end
end
