require 'rails_helper'

RSpec.describe "municipes/new", type: :view do
  before(:each) do
    assign(:municipe, Municipe.new(
      name: "MyString",
      cpf: 1,
      cns: 1,
      email: "MyString",
      birthday: 1,
      phone_country: 1,
      phone_area: "MyString",
      integer: "MyString",
      phone_number: 1,
      photo: "MyString",
      status: false
    ))
  end

  it "renders new municipe form" do
    render

    assert_select "form[action=?][method=?]", municipes_path, "post" do

      assert_select "input[name=?]", "municipe[name]"

      assert_select "input[name=?]", "municipe[cpf]"

      assert_select "input[name=?]", "municipe[cns]"

      assert_select "input[name=?]", "municipe[email]"

      assert_select "input[name=?]", "municipe[birthday]"

      assert_select "input[name=?]", "municipe[phone_country]"

      assert_select "input[name=?]", "municipe[phone_area]"

      assert_select "input[name=?]", "municipe[integer]"

      assert_select "input[name=?]", "municipe[phone_number]"

      assert_select "input[name=?]", "municipe[photo]"

      assert_select "input[name=?]", "municipe[status]"
    end
  end
end
