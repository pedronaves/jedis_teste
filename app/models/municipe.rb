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
    auth_token = '49a14552468ad1079cc4dca66918a9cd'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+12524604039'
    to = '+5562996334685' # por questões de segurança e por ser uma conta de teste, apenas números que estejam salvos serào notificados. é necessário criar uma conta para produção e então implementar o envio para qualquer número.

    client.messages.create(
    from: from,
    to: to,
    body: "Conta salva!"
    )
  end
end
