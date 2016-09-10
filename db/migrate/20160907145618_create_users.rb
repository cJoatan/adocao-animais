class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :user_name
      t.string :adress
      t.integer :adress_number
      t.string :complement
      t.string :cep
      t.string :state
      t.integer :genre
      t.integer :age
      t.boolean :admin

      t.timestamps
    end
  end
end
