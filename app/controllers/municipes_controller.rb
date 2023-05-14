# frozen_string_literal: true

class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[show edit update]

  def index
    @municipes = Municipe.all.order('created_at DESC')
  end

  def show; end

  def show_address
    @municipe = Municipe.find_by_id(params[:municipe_id])
    @address = Address.find_by_municipe_id(@municipe)
  end

  def new
    @municipe = Municipe.new
  end

  def edit; end

  def create

    @municipe = Municipe.new(municipe_params)

    respond_to do |format|
      if @municipe.save
        to_email = params[:municipe][:email]
        UserMailer.new_municipe(to_email).deliver_now
        format.html { redirect_to municipes_url, notice: 'Cadastro realizado com sucesso.' }
        format.json { render :show, status: :created, location: @municipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @municipe.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @municipe.update(municipe_params)
        to_email = params[:municipe][:email]
        UserMailer.update_municipe(to_email).deliver_now
        format.html { redirect_to municipe_url(@municipe), notice: 'Cadastro atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @municipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @municipe.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_municipe
    @municipe = Municipe.find(params[:id])
  end

  def municipe_params
    params[:municipe][:cpf].gsub!(/\D/, "").to_i
    params[:municipe][:cns].gsub!(/\D/, "").to_i
    params[:municipe][:phone_country].gsub!(/\D/, "").to_i
    params[:municipe][:phone_area].gsub!(/\D/, "").to_i
    params[:municipe][:phone_number].gsub!(/\D/, "").to_i
    params.require(:municipe).permit(:name, :cpf, :cns, :email, :birthday, :phone_country, :phone_area,
                                     :phone_number, :image, :status)
  end
end
