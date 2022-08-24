class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
    @item = Item.all.size
  end

  def show
    @cart_item = CartItem.new
    @item = Item.find(params[:id])  
    @genre = Genre.all
  end
end
