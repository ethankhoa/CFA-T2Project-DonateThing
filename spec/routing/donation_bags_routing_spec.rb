require "rails_helper"

RSpec.describe DonationBagsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/donation_bags").to route_to("donation_bags#index")
    end

    it "routes to #new" do
      expect(:get => "/donation_bags/new").to route_to("donation_bags#new")
    end

    it "routes to #show" do
      expect(:get => "/donation_bags/1").to route_to("donation_bags#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/donation_bags/1/edit").to route_to("donation_bags#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/donation_bags").to route_to("donation_bags#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/donation_bags/1").to route_to("donation_bags#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/donation_bags/1").to route_to("donation_bags#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/donation_bags/1").to route_to("donation_bags#destroy", :id => "1")
    end

  end
end
