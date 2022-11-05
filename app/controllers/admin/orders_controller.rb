class Admin::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @order = Order.find(params[:id])
    @total = @order.billing_amount - 800
  end

  def update
    order = Order.find(params[:id])
    order.update
    redirect_to admin_order_path(order.id)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
