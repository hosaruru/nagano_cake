class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
    @item = Item.new
    @genres = Genre.all
  end

  def new
     @item = Item.new
  end

  def create
     @item = Item.new(item_params)
    @item.save
    redirect_to '/admin/items'
  end

  def show
    @item = Item.find(params[:id])  
    @genre = Genre.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to '/admin/items'
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :genre_id, :is_active)
  end
end
