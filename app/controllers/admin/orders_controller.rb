class Admin::OrdersController < ApplicationController
  def show
  @order = Order.find(params[:id])
  @orders = Order.all
  @total = 0
  
  #     if params[:status] == "waiting_pay"
  #     @payment_method = "入金待ち"
  #   elsif params[:status] == "payed"
  #     @payment_method = "入金確認"
  #   elsif params[:status] == "progress"
  #     @payment_method = "製作中"
  #   elsif params[:status] == "standby"
  #     @payment_method = "発送準備中"
  #   elsif params[:status] == "complete"
  #     @payment_method = "発送済み"
  #   end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(params[:id])
    else
      render :show
    end
  end
  
  private

  def order_params
    params.require(:order).permit(:status)
  end
end
