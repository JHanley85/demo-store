require 'spec_helper'

describe "stores/new" do
  before(:each) do
    assign(:store, stub_model(Store,
      :user_id => 1,
      :name => "MyString",
      :description => "MyString",
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new store form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stores_path, "post" do
      assert_select "input#store_user_id[name=?]", "store[user_id]"
      assert_select "input#store_name[name=?]", "store[name]"
      assert_select "input#store_description[name=?]", "store[description]"
      assert_select "input#store_url[name=?]", "store[url]"
    end
  end
end
