require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        postal_code: "Postal Code",
        address: "Address",
        address_complement: "Address Complement",
        neighborhood: "Neighborhood",
        city: "City",
        state: "State",
        ibge_code: "Ibge Code",
        municipe: nil
      ),
      Address.create!(
        postal_code: "Postal Code",
        address: "Address",
        address_complement: "Address Complement",
        neighborhood: "Neighborhood",
        city: "City",
        state: "State",
        ibge_code: "Ibge Code",
        municipe: nil
      )
    ])
  end

  it "renders a list of addresses" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Postal Code".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Address".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Address Complement".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Neighborhood".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("City".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("State".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Ibge Code".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
