require 'rails_helper'

RSpec.describe "orgs/index", type: :view do
  before(:each) do
    assign(:orgs, [
      Org.create!(
        :name => "Name",
        :org_type => "Org Type",
        :phone => "Phone",
        :website => "Website",
        :logo => "Logo",
        :images => "",
        :user => nil,
        :googleplaceid => "Googleplaceid"
      ),
      Org.create!(
        :name => "Name",
        :org_type => "Org Type",
        :phone => "Phone",
        :website => "Website",
        :logo => "Logo",
        :images => "",
        :user => nil,
        :googleplaceid => "Googleplaceid"
      )
    ])
  end

  it "renders a list of orgs" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Org Type".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Logo".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Googleplaceid".to_s, :count => 2
  end
end
