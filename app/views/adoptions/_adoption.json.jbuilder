json.extract! adoption, :id, :animal_type, :breed, :price, :age, :user_creator, :user_adopted, :created_at, :updated_at
json.url adoption_url(adoption, format: :json)