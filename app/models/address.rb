# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :municipe

  validates :postal_code, :address, :address_complement, :neighborhood, :city, :state, presence: true
end
