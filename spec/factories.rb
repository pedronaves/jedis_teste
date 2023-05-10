# frozen_string_literal: true

FactoryBot.define do
  factory :municipe do
    name { "MyString" }
    cpf { 1 }
    cns { 1 }
    email { "MyString" }
    birthday { 1 }
    phone_country { 1 }
    phone_area { "MyString" }
    integer { "MyString" }
    phone_number { 1 }
    photo { "MyString" }
    status { false }
  end

  factory(:user) do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
