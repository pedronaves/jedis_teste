class AddressesController < ApplicationController
  before_action :get_municipe
  before_action :set_address, only: %i[ show edit update destroy ]

  def index
    @addresses = @municipe.address
  end

  def show
  end

  def new
    @address = @municipe.address.new
  end

  def edit
  end

  def create
    @address = @municipe.address.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to municipe_addresses_path(@municipe), notice: "Endereço criado com sucesso." }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to municipe_addresses_path(@municipe), notice: "Endereço editado com sucesso." }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @address.destroy

    respond_to do |format|
      format.html { redirect_to municipe_addresses_path(@municipe), notice: "Endereço excluído com sucesso." }
      format.json { head :no_content }
    end
  end


  private
    def set_address
      @address = @municipe.address.find(params[:id])
    end

    def get_municipe
      @municipe = Municipe.find(params[:municipe_id])
    end

    def address_params
      params.require(:address).permit(:postal_code, :address, :address_complement, :neighborhood, :city, :state, :ibge_code, :municipe_id)
    end
end