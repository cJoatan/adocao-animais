require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :full_name => "MyString",
      :user_name => "MyString",
      :adress => "MyString",
      :adress_number => "",
      :complement => "MyString",
      :cep => "MyString",
      :state => "MyString",
      :genre => "",
      :age => "",
      :admin => false
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_full_name[name=?]", "user[full_name]"

      assert_select "input#user_user_name[name=?]", "user[user_name]"

      assert_select "input#user_adress[name=?]", "user[adress]"

      assert_select "input#user_adress_number[name=?]", "user[adress_number]"

      assert_select "input#user_complement[name=?]", "user[complement]"

      assert_select "input#user_cep[name=?]", "user[cep]"

      assert_select "input#user_state[name=?]", "user[state]"

      assert_select "input#user_genre[name=?]", "user[genre]"

      assert_select "input#user_age[name=?]", "user[age]"

      assert_select "input#user_admin[name=?]", "user[admin]"
    end
  end
end
