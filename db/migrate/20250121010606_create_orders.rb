class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true # 購入者（ユーザー）
      t.references :item, null: false, foreign_key: true # 購入された商品
      
      t.timestamps
    end
  end
end