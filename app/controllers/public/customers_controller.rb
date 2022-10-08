class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @customer_fullname = @customer.last_name + @customer.first_name
    @customer_fullname_kana = @customer.last_name_kana + @customer.first_name_kana
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update
    redirect_to my_page_path
  end

  def confirm
  end

  def destroy
  end
end
