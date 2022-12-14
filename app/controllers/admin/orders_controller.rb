class Admin::OrdersController < ApplicationController


  def show
    @order = Order.find(params[:id])
    @total = @order.billing_amount - 800
  end

  def update
    order = Order.find(params[:id])
    order_details = order.order_details.all
    if params[:order][:status] == "confirmed"
      order_details.update(making_status: 1)
    end
    order.update(order_params)
    redirect_to admin_order_path(order.id)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
