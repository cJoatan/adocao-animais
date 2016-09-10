require 'rails_helper'

RSpec.describe Adoption, type: :model do
  
  it 'User create Adoption' do

  	user = User.new(user_name: "joel", email: "joel@gmail.com", password: "joel123")
  	user.save

  	adoption = Adoption.new(user_creator: user)
  	adoption.save

  	expect(user.adoptions_created.size).to eq 1
  end
end
