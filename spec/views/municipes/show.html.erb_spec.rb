# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'municipes/show', type: :view do
  before(:each) do
    assign(:municipe, Municipe.create!(
                        name: 'Name',
                        cpf: 2,
                        cns: 3,
                        email: 'Email',
                        birthday: 4,
                        phone_country: 5,
                        phone_area: 'Phone Area',
                        integer: 'Integer',
                        phone_number: 6,
                        photo: 'Photo',
                        status: false
                      ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/Phone Area/)
    expect(rendered).to match(/Integer/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/Photo/)
    expect(rendered).to match(/false/)
  end
end
