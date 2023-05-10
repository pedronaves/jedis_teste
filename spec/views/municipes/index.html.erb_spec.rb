require 'rails_helper'

RSpec.describe "municipes/index", type: :view do
  before(:each) do
    assign(:municipes, [
      Municipe.create!(
        name: "Name",
        cpf: 2,
        cns: 3,
        email: "Email",
        birthday: 4,
        phone_country: 5,
        phone_area: "Phone Area",
        integer: "Integer",
        phone_number: 6,
        photo: "Photo",
        status: false
      ),
      Municipe.create!(
        name: "Name",
        cpf: 2,
        cns: 3,
        email: "Email",
        birthday: 4,
        phone_country: 5,
        phone_area: "Phone Area",
        integer: "Integer",
        phone_number: 6,
        photo: "Photo",
        status: false
      )
    ])
  end

  it "renders a list of municipes" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Phone Area".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Integer".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(6.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Photo".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
