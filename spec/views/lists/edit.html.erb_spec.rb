require 'rails_helper'

RSpec.describe "lists/edit", type: :view do
  before(:each) do
    @list = assign(:list, List.create!(
      :title => "MyString",
      :body => "MyText",
      :group => nil
    ))
  end

  it "renders the edit list form" do
    render

    assert_select "form[action=?][method=?]", list_path(@list), "post" do

      assert_select "input#list_title[name=?]", "list[title]"

      assert_select "textarea#list_body[name=?]", "list[body]"

      assert_select "input#list_group_id[name=?]", "list[group_id]"
    end
  end
end
