class ItemsController < ApplicationController
  def index
    # 全てのアイテムを取得
    @items = Item.all
  end

  def new
    # 新しいアイテムインスタンスを生成
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to '/'
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :text)
  end
end
