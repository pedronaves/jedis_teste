require 'rails_helper'

RSpec.describe "addresses/show", type: :view do
  before(:each) do
    assign(:address, Address.create!(
      postal_code: "Postal Code",
      address: "Address",
      address_complement: "Address Complement",
      neighborhood: "Neighborhood",
      city: "City",
      state: "State",
      ibge_code: "Ibge Code",
      municipe: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Postal Code/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Address Complement/)
    expect(rendered).to match(/Neighborhood/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Ibge Code/)
    expect(rendered).to match(//)
  end
end
