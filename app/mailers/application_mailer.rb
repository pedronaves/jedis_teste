# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "oi@pedronaves.com"
  layout "mailer"
end
