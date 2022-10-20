class Public::CartItemsController < ApplicationController
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
  end

  def destroy
  end

  def destroy_all
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
