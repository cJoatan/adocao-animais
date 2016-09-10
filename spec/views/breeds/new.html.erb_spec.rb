require 'rails_helper'

RSpec.describe "breeds/new", type: :view do
  before(:each) do
    assign(:breed, Breed.new(
      :name => "MyString",
      :description => "MyString",
      :animal_id => 1
    ))
  end

  it "renders new breed form" do
    render

    assert_select "form[action=?][method=?]", breeds_path, "post" do

      assert_select "input#breed_name[name=?]", "breed[name]"

      assert_select "input#breed_description[name=?]", "breed[description]"

      assert_select "input#breed_animal_id[name=?]", "breed[animal_id]"
    end
  end
end
