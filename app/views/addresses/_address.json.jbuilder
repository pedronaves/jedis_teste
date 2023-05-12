# frozen_string_literal: true

json.extract! address, :id, :postal_code, :address, :address_complement, :neighborhood, :city, :state, :ibge_code,
              :municipe_id, :created_at, :updated_at
json.url address_url(address, format: :json)
