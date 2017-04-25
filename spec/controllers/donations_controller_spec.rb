require 'rails_helper'

RSpec.describe DonationsController, type: :controller do

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #donations" do
    it "returns http success" do
      get :donations
      expect(response).to have_http_status(:success)
    end
  end

end
