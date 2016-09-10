require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
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
      ),
      User.create!(
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
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
    assert_select "tr>td", :text => "Adress".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Complement".to_s, :count => 2
    assert_select "tr>td", :text => "Cep".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
