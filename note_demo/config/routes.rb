Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # 創造一個 get "/hello", to: "pages#main" 可以連到/hello頁面
  # 名字要對的起來

  # 1.手刻做about出來！！！
  # 2.用 g controller 做做看
  get "/hello", to: "pages#main"
  get "/about", to: "pages#about"
  # 接著在pages建立about.html.erb


 

  # get "/notes", to: "notes#index"
  # get "/notes/new", to: "notes#new"
  # get "/notes", to: "notes#index"

  # resources 直接生8條路徑，不用像上面一樣一個一個慢慢寫
  



  # 讓 index 直接在首頁顯示
  get "/", to: "notes#index"
  resources :notes
  # 萬一要改網頁路徑名要怎辦?
  # 用 path:"articles"可以直接改網頁路徑名，網址從/notes變成/articles
  # resources :notes, path:"articles"


  get "/users", to: "users#profile"
  # 對於使用者只要開建立使用者的路徑就好
  # 不需要使用者列表(後臺看到就好)
  # sign_up 送出後會送到 create 所以需要這個路徑
  resources :users, only: [:create] do
    # 路徑： GET /users/sign_up 註冊表單
    # 路徑： GET /users/sign_in 登入表單
    # collection 追加路徑，方法 :方法名稱
    collection do
      get :sign_up
      get :sign_in
    end
  end

  # post :sign_in 拉出去做
  # 登入跟註冊是兩件事情，註冊是一般的 CRUD，但登入會用到 sessions，所以把他獨立拉出來寫
  # sessions 是某個 controller 的名字
  # 寫入 sessions = 登入，用 as 換 path 名字，看起來比較乾淨
  post "/users/sign_in", to: "sessions#create", as: "login"
  # 刪除 sessions = 登出
  delete "/users", to: "sessions#destroy", as: "logout"
end