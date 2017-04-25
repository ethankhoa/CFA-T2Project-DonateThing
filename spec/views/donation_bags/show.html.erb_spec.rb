require 'rails_helper'

RSpec.describe "donation_bags/show", type: :view do
  before(:each) do
    @donation_bag = assign(:donation_bag, DonationBag.create!(
      :user => nil,
      :bag_status => nil,
      :total_quantity => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
