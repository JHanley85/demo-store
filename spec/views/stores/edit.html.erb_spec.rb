require 'spec_helper'

describe "stores/edit" do
  before(:each) do
    @store = assign(:store, stub_model(Store,
      :user_id => 1,
      :name => "MyString",
      :description => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit store form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", store_path(@store), "post" do
      assert_select "input#store_user_id[name=?]", "store[user_id]"
      assert_select "input#store_name[name=?]", "store[name]"
      assert_select "input#store_description[name=?]", "store[description]"
      assert_select "input#store_url[name=?]", "store[url]"
    end
  end
end
