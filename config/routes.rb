Rails.application.routes.draw do
  devise_for :users
  




    root to: "items#index"
  # Defines the root path route ("/")
  # root "articles#index"
  resources :items # 商品関連のルーティングを設定
end
