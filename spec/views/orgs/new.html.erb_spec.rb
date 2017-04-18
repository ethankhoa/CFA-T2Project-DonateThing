require 'rails_helper'

RSpec.describe "orgs/new", type: :view do
  before(:each) do
    assign(:org, Org.new(
      :name => "MyString",
      :org_type => "MyString",
      :phone => "MyString",
      :website => "MyString",
      :logo => "MyString",
      :images => "",
      :user => nil,
      :googleplaceid => "MyString"
    ))
  end

  it "renders new org form" do
    render

    assert_select "form[action=?][method=?]", orgs_path, "post" do

      assert_select "input#org_name[name=?]", "org[name]"

      assert_select "input#org_org_type[name=?]", "org[org_type]"

      assert_select "input#org_phone[name=?]", "org[phone]"

      assert_select "input#org_website[name=?]", "org[website]"

      assert_select "input#org_logo[name=?]", "org[logo]"

      assert_select "input#org_images[name=?]", "org[images]"

      assert_select "input#org_user_id[name=?]", "org[user_id]"

      assert_select "input#org_googleplaceid[name=?]", "org[googleplaceid]"
    end
  end
end
