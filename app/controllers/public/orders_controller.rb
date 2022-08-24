class Public::OrdersController < ApplicationController
  def new
     @orders = Order.new
    # @order = Order.find(params[:id])  
  end

  def confirm
    @cart_item = current_customer.cart_items
     @total = 0
     @postage = 800
    @total_payment = @postage + @total
     
      if params[:order][:payment_method] == "0"
      @payment_method = "credit_card"
    elsif params[:order][:payment_method] == "1"
      @payment_method = "transfer"
    end
    
    @order = Order.new
  if  params[:order][:address_option] == "0" 
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name =  current_customer.last_name + current_customer.first_name
    
    elsif  params[:order][:address_option] == "1" 
    @order.postal_code = params[:order][:postal_code]
    @order.address = params[:order][:address]
    @order.name = params[:order][:name]
    
    elsif  params[:order][:address_option] == "2" 
    @order.postal_code = params[:order][:postal_code]
    @order.address = params[:order][:address]
    @order.name = params[:order][:name]
    
   @numbers = *[1..10]
  
  end
  end

  def complete 
      @order = current_customer.orders.build(order_params)
      @order.status = 0
      @order.save!
      cart_items = current_customer.cart_items
      cart_items.each do |cart_item|
      order_detail = @order.order_details.build
      order_detail.item_id = cart_item.item.id
      order_detail.amount = cart_item.amount
      order_detail.price = cart_item.item.price
      order_detail.save
    end
    cart_items.destroy_all
  end

  def craate
  end

  def index
  @orders = current_customer.orders.all
  end

  def show
     @order = Order.find(params[:id])
      @total = 0
  end
    private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :customer_id)
    # params.require(:order).permit(:name, :postal_code, :address, :payment_method, :status, :total_payment, :address)
  end
end
