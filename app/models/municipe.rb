# frozen_string_literal: true

class Municipe < ApplicationRecord

  include Cns

  has_many :address, dependent: :destroy

  include ImageUploader::Attachment(:image)
  validates :name, :cpf, :cns, :email, :birthday, :phone_country, :phone_area, :phone_number, :image, presence: true

  validates_email_format_of :email, disposable: true
  validates_cpf_format_of :cpf

  validate :email_valid?, :cns_valid?

  after_create :send_sms
  after_update :send_sms

  def email_valid?
    return errors.add(:email, 'inválido') unless email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end

  def cns_valid?
    return errors.add(:cns, 'inválido') unless Cns.validate(cns)
  end

  def send_sms
    account_sid = 'ACf1d64e97b71429004e32736adca67d66'
    auth_token = '61d27f26234182919f6121a1dddedf5c'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    # phone_complete = '+' + phone_country.to_s + phone_area.to_s + phone_number.to_s
    # contas trial só podem enviar sms para números previamente cadastrados

    phone_complete = '+5562996334685'
    from = '+12524604039'
    to = phone_complete

    client.messages.create(
      from: from,
      to: to,
      body: "Conta salva!"
    )
  end
end
