class Public::AddressesController < ApplicationController
  def create
    address = Address.new(address_params)
    address.save
    redirect_to addresses_path
  end

  def index
    @addresses = Address.all
    @address = Address.new
  end

  def show
    @address = Address.find(params[:id])
  end

  def edit
    @address = Address.find(params[:id])
  end

  def updatae
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
end
