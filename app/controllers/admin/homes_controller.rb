class Admin::HomesController < ApplicationController
  def top

  end

  def index
    @orders = Order.all
  end

end
