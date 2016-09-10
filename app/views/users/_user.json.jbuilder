json.extract! user, :id, :full_name, :user_name, :adress, :adress_number, :complement, :cep, :state, :genre, :age, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)