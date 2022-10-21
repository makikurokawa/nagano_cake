class Public::CartItemsController < ApplicationController
   before_action :authenticate_customer!

  def create
    cart_item = current_customer.cart_items.new(cart_item_params)
    cart_item.save
    redirect_to cart_items_path
  end

  def index
    @cart_items = CartItem.all
    @sum = 0
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
