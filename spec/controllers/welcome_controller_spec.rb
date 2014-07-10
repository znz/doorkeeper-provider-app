require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  describe "GET 'index'" do
    it "returns http success" do
      sign_in user
      get 'index'
      expect(response).to be_success
    end
  end

end
