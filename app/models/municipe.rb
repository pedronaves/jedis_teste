# frozen_string_literal: true

class Municipe < ApplicationRecord
  include ImageUploader::Attachment(:image)
  validates :name, presence: true
  validates :cpf, presence: true
  validates :cns, presence: true
  validates :email, presence: true
  validates :birthday, presence: true
  validates :phone_country, presence: true
  validates :phone_area, presence: true
  validates :phone_number, presence: true
  validates :image, presence: true

  has_many :address, dependent: :destroy
end
