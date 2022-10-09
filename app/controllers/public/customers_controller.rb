class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
    @customer_fullname = @customer.last_name +   @customer.first_name
    @customer_fullname_kana = @customer.last_name_kana +   @customer.first_name_kana
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    customer.update
    redirect_to my_page_path
  end

  def confirm
  end

  def destroy
  end
end
