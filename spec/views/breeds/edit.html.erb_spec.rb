require 'rails_helper'

RSpec.describe "breeds/edit", type: :view do
  before(:each) do
    @breed = assign(:breed, Breed.create!(
      :name => "MyString",
      :description => "MyString",
      :animal_id => 1
    ))
  end

  it "renders the edit breed form" do
    render

    assert_select "form[action=?][method=?]", breed_path(@breed), "post" do

      assert_select "input#breed_name[name=?]", "breed[name]"

      assert_select "input#breed_description[name=?]", "breed[description]"

      assert_select "input#breed_animal_id[name=?]", "breed[animal_id]"
    end
  end
end
