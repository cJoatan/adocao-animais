require 'rails_helper'

RSpec.describe "adoptions/show", type: :view do
  before(:each) do
    @adoption = assign(:adoption, Adoption.create!(
      :animal_type => 2,
      :breed => "Breed",
      :price => "9.99",
      :age => 3,
      :user_creator => 4,
      :user_adopted => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Breed/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
  end
end
