class Admin::OrderDetailsController < ApplicationController


  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = Order.find(@order_detail.order_id)
    @order_details = @order.order_details.all

    is_updated = true
    if @order_detail.update(order_detail_params)
      if params[:order_detail][:making_status] = "making"
        @order.update(status: 2)
      end
      @order_details.each do |order_detail|
        if order_detail.making_status != "complete"
          is_updated = false
        end
      end
      @order.update(status: 3) if is_updated
    end
    redirect_to admin_order_path(@order_detail.order.id)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
