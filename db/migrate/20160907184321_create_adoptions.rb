class CreateAdoptions < ActiveRecord::Migration[5.0]
  def change
    create_table :adoptions do |t|
      t.integer :animal_type
      t.string :breed
      t.decimal :price
      t.integer :age
      t.integer :user_creator
      t.integer :user_adopted

      t.timestamps
    end
  end
end
