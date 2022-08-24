class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order =  @order_detail.order
    if @order_detail.update(detail_params)
      redirect_to admin_order_path(@order.id)
    else
      @order_detail.errors.full_messages.each do | msg | 
        pp msg        
      end
      redirect_to admin_order_path(@order.id)
    end
  end

  private
  def detail_params
    params.require(:order_detail).permit(:making_status)
  end

end