class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!


  def new
    @order = Order.new
    @current_customer = current_customer
  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to orders_confirm_path
  end

  def index
    @orders = Order.all
  end

  def confirm
    if params[:order][:select_address] == "2"
      @order = Order.new(order_params)
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:select_address])
    else
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    end
    @orders = Order.all
  end

  def show
    @order = Oder.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end
