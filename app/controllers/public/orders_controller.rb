class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!


  def new
    @order = Order.new
    @current_customer = current_customer
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    @order.status = 0
    if @order.save
      cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.price_including_tax = cart.item.with_tax_price
        order_detail.quantity = cart.amount
        order_detail.making_status = 0
        order_detail.save
      end
      redirect_to orders_complete_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def index
    @orders = Order.all
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    end
      @cart_items = current_customer.cart_items
      @sum = 0
  end

  def show
    @order = Order.find(params[:id])
    @sum = 0
    @total = @order.billing_amount - 800
  end

  private
  def order_params
    params.require(:order).permit(:payment, :postal_code, :address, :name, :billing_amount, :postage)
  end

end
