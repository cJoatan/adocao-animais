require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :full_name => "Full Name",
      :user_name => "User Name",
      :adress => "Adress",
      :adress_number => "",
      :complement => "Complement",
      :cep => "Cep",
      :state => "State",
      :genre => "",
      :age => "",
      :admin => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/User Name/)
    expect(rendered).to match(/Adress/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Complement/)
    expect(rendered).to match(/Cep/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
