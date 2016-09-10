class CreateAdoptionsImages < ActiveRecord::Migration[5.0]
  def change
    create_table :adoptions_images do |t|
    	t.integer :adoption_id
    	t.attachment :avatar
      t.timestamps
    end
  end
end
