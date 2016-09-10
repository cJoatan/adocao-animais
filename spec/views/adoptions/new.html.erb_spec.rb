require 'rails_helper'

RSpec.describe "adoptions/new", type: :view do
  before(:each) do
    assign(:adoption, Adoption.new(
      :animal_type => 1,
      :breed => "MyString",
      :price => "9.99",
      :age => 1,
      :user_creator => 1,
      :user_adopted => 1
    ))
  end

  it "renders new adoption form" do
    render

    assert_select "form[action=?][method=?]", adoptions_path, "post" do

      assert_select "input#adoption_animal_type[name=?]", "adoption[animal_type]"

      assert_select "input#adoption_breed[name=?]", "adoption[breed]"

      assert_select "input#adoption_price[name=?]", "adoption[price]"

      assert_select "input#adoption_age[name=?]", "adoption[age]"

      assert_select "input#adoption_user_creator[name=?]", "adoption[user_creator]"

      assert_select "input#adoption_user_adopted[name=?]", "adoption[user_adopted]"
    end
  end
end
