# frozen_string_literal: true

json.extract! municipe, :id, :name, :cpf, :cns, :email, :birthday, :phone_country, :phone_area, :phone_number, :photo,
              :status, :created_at, :updated_at
json.url municipe_url(municipe, format: :json)
