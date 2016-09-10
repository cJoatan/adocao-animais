require 'rails_helper'

RSpec.describe "Adoptions", type: :request do
  describe "GET /adoptions" do
    it "works! (now write some real specs)" do
      get adoptions_path
      expect(response).to have_http_status(200)
    end
  end
end
