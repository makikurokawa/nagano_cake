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
  end

  def show
    @order = Oder.find(params[:id])
  end

  private
  def order_params
    params.require(:oeder).permit(:postal_code, :address, :name, :payment)
  end

end
