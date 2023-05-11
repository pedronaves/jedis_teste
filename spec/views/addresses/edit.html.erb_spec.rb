require 'rails_helper'

RSpec.describe "addresses/edit", type: :view do
  let(:address) {
    Address.create!(
      postal_code: "MyString",
      address: "MyString",
      address_complement: "MyString",
      neighborhood: "MyString",
      city: "MyString",
      state: "MyString",
      ibge_code: "MyString",
      municipe: nil
    )
  }

  before(:each) do
    assign(:address, address)
  end

  it "renders the edit address form" do
    render

    assert_select "form[action=?][method=?]", address_path(address), "post" do

      assert_select "input[name=?]", "address[postal_code]"

      assert_select "input[name=?]", "address[address]"

      assert_select "input[name=?]", "address[address_complement]"

      assert_select "input[name=?]", "address[neighborhood]"

      assert_select "input[name=?]", "address[city]"

      assert_select "input[name=?]", "address[state]"

      assert_select "input[name=?]", "address[ibge_code]"

      assert_select "input[name=?]", "address[municipe_id]"
    end
  end
end
