require 'rails_helper'

RSpec.describe "orgs/show", type: :view do
  before(:each) do
    @org = assign(:org, Org.create!(
      :name => "Name",
      :org_type => "Org Type",
      :phone => "Phone",
      :website => "Website",
      :logo => "Logo",
      :images => "",
      :user => nil,
      :googleplaceid => "Googleplaceid"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Org Type/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/Logo/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Googleplaceid/)
  end
end
