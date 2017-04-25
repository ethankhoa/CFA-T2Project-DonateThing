require 'rails_helper'

RSpec.describe "donation_bags/new", type: :view do
  before(:each) do
    assign(:donation_bag, DonationBag.new(
      :user => nil,
      :bag_status => nil,
      :total_quantity => 1
    ))
  end

  it "renders new donation_bag form" do
    render

    assert_select "form[action=?][method=?]", donation_bags_path, "post" do

      assert_select "input#donation_bag_user_id[name=?]", "donation_bag[user_id]"

      assert_select "input#donation_bag_bag_status_id[name=?]", "donation_bag[bag_status_id]"

      assert_select "input#donation_bag_total_quantity[name=?]", "donation_bag[total_quantity]"
    end
  end
end
