Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "test", to: "test#index"

  #ログイン関連のルーティング
  #(表示：new、ログイン処理：create)
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

  #商品管理のルーティング
  #(一覧画面表示：index、登録画面表示：new、登録処理：create、
  #    編集画面表示：edit、編集処理：update)
  resources :items, only: [:index, :new, :create, :edit, :update, :destroy]

end
