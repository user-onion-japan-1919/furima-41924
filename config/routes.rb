Rails.application.routes.draw do


  devise_for :users
  
    root to: "items#index"
    root "donations#index"
 resources :items  # 必要に応じて追加
 resources :orders, only: [:index, :new, :create] # 購入履歴（index）が必要なら追加
 resources :donations, only: :index
end
