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
    # 新しいアイテムを作成
    @item = Item.new(item_params)

    # アイテムが正常に保存できたらリダイレクト
    if @item.save
      redirect_to root_path
    else
      # 保存に失敗した場合は新規作成ページに戻る
      render :new, status: :unprocessable_entity

    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :text, :category_id, :condition_id, :shipping_fee_id, :prefecture_id,
                                 :delivery_time_id, :price).merge(user_id: current_user.id)
  end
end
