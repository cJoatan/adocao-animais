require 'rails_helper'

RSpec.describe "adoptions/index", type: :view do
  before(:each) do
    assign(:adoptions, [
      Adoption.create!(
        :animal_type => 2,
        :breed => "Breed",
        :price => "9.99",
        :age => 3,
        :user_creator => 4,
        :user_adopted => 5
      ),
      Adoption.create!(
        :animal_type => 2,
        :breed => "Breed",
        :price => "9.99",
        :age => 3,
        :user_creator => 4,
        :user_adopted => 5
      )
    ])
  end

  it "renders a list of adoptions" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Breed".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
