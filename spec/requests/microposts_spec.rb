require 'rails_helper'

RSpec.describe "Microposts", :type => :request do
  describe "GET /microposts" do
    it "works! (now write some real specs)" do
      get microposts_path
      expect(response.status).to be(200)
    end
  end
end
