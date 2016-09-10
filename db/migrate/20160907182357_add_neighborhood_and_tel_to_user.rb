class AddNeighborhoodAndTelToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :neighborhood, :string
    add_column :users, :tel_1, :string
    add_column :users, :tel_2, :string
  end
end
