Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # 創造一個 get "/hello", to: "pages#main" 可以連到/hello頁面
  # 名字要對的起來

  # 1.手刻做about出來！！！
  # 2.用 g controller 做做看
  get "/hello", to: "pages#main"
  get "/about", to: "pages#about"
  # 接著在pages建立about.html.erb


  get "/users", to: "pages#profile"

  # get "/notes", to: "notes#index"
  # get "/notes/new", to: "notes#new"
  # get "/notes", to: "notes#index"

  # resources 直接生8條路徑，不用像上面一樣一個一個慢慢寫
  resources :notes
  # 萬一要改網頁路徑名要怎辦?
  # 用 path:"articles"可以直接改網頁路徑名，網址從/notes變成/articles
  # resources :notes, path:"articles"
end