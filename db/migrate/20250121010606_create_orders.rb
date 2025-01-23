class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
          t.string :item_name, null: false           # 商品名
          t.text :item_description, null: false      # 商品説明
          t.integer :price, null: false         # 価格
          t.references :user, null: false, foreign_key: true # 出品者 (ユーザー)
          t.integer :category_id, null: false   # カテゴリ
          t.integer :condition_id, null: false  # 商品の状態
          t.integer :shipping_fee_id, null: false # 配送料の負担
          t.integer :prefecture_id, null: false # 発送元の地域
          t.integer :shipping_day_id, null: false # 発送までの日数
    
      t.timestamps
    end
  end
end
