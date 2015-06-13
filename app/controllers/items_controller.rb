class ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  def show
    #Itemというmodelに対してfindメソッドでidを検索させている
    @item = Item.find(params[:id])
  end
  def index
    @items = Item.all
  end
  def create
    #フォームからデータを受け取る
    @item = Item.new(item_params)
    #これを保存する
    @item.save
    #show.html.erbに飛ばす
    redirect_to "/items/#{@item.id}"
  end
  def edit
    #http://localhost:3000/items/5/edit
    #上記のurlを取得して、@item=Item.find(5)
    @item = Item.find(params[:id])
  end

  def update
    # :idでItem
    #上記のurlを取得して、@item=Item.find(5)
    @item = Item.find(params[:id])
    @item.update_attributes(item_params)
    redirect_to "/items/#{@item.id}"

  end

  private
  def item_params
    # params.require(:key).permit(:filter)
    params.require(:item).permit(
      :name,
      :price,
      :seller_id,
      :description,
      :email,
      :image_url
      )
  end

end
