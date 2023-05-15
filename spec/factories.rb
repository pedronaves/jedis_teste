# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    postal_code { '74230030' }
    address { 'Rua Exemplo' }
    address_complement { 'Complemento' }
    neighborhood { 'Bairro' }
    city { 'Goiânia' }
    state { 'GO' }
    ibge_code { '88888' }
    municipe { 1 }
  end

  factory :municipe do
    name { 'Pedro Naves' }
    cpf { 11111111111 }
    cns { 1111111111111111111 }
    email { 'email@email.com' }
    birthday { 1 }
    phone_country { '55' }
    phone_area { '62' }
    phone_number { '99999 99999' }
    photo { 'foto' }
    status { false }
  end

end
