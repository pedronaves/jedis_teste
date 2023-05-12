class UserMailer < ApplicationMailer
  default :to   => 'admin@pedronaves.com',
          :from => 'no-reply@pedronaves.com',
          :subject => 'Testando Email'

  def new_municipe(to)
     mail(to: to, subject: 'Novo Cadastro', :template_name => 'new_municipe')
  end

  def update_municipe(to)
     mail(to: to, subject: 'Cadastro Atualizado', :template_name => 'update_municipe')
  end
end