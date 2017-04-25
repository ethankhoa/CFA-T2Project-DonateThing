require 'rails_helper'

RSpec.describe "donation_bags/index", type: :view do
  before(:each) do
    assign(:donation_bags, [
      DonationBag.create!(
        :user => nil,
        :bag_status => nil,
        :total_quantity => 2
      ),
      DonationBag.create!(
        :user => nil,
        :bag_status => nil,
        :total_quantity => 2
      )
    ])
  end

  it "renders a list of donation_bags" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
