class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @price = (@item.price * 1.1).round
    @cart_item = CartItem.new
  end

end
