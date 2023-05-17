# frozen_string_literal: true

class Municipe < ApplicationRecord
  include ImageUploader::Attachment(:image)
  validates :name, :cpf, :cns, :email, :birthday, :phone_country, :phone_area, :phone_number, :image, presence: true

  validates_cpf_format_of :cpf

  has_many :address, dependent: :destroy
end
