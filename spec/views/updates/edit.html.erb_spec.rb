require 'spec_helper'

describe "updates/edit" do
  before(:each) do
    @update = assign(:update, stub_model(Update,
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit update form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", update_path(@update), "post" do
      assert_select "input#update_title[name=?]", "update[title]"
      assert_select "textarea#update_body[name=?]", "update[body]"
    end
  end
end
