require 'rails_helper'

RSpec.describe "breeds/show", type: :view do
  before(:each) do
    @breed = assign(:breed, Breed.create!(
      :name => "Name",
      :description => "Description",
      :animal_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
  end
end
