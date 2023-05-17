# frozen_string_literal: true

class Municipe < ApplicationRecord

  include Cns

  has_many :address, dependent: :destroy

  include ImageUploader::Attachment(:image)
  validates :name, :cpf, :cns, :email, :birthday, :phone_country, :phone_area, :phone_number, :image, presence: true

  validates_email_format_of :email, disposable: true
  validates_cpf_format_of :cpf

  validate :email_valid?, :cns_valid?

  def email_valid?
    return errors.add(:email, 'inválido') unless email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end

  def cns_valid?
    return errors.add(:cns, 'inválido') unless Cns.validate(cns)
  end
end
