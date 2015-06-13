class ItemsController < ApplicationController
  def show
    #Itemというmodelに対してfindメソッドでidを検索させている
    @item = Item.find(params[:id])
  end
  def index
    @items = Item.all
  end
end
