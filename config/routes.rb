Rails.application.routes.draw do

  #model Home
  get 'home/top' => 'home#top' #topアクション作る
  root :to => 'home#top' #topページのURLを”/”のみにする

  get 'home/about' => 'home#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #model deviseのUser
  devise_for :users #deviseを使用する際にURLとしてusersを含むことを示す(自動で追加される)
  root 'user_path#show' #deviseでは、ログイン認証が成功した場合、config/routes.rbファイル内で設定されているrootパスへリダイレクトされる。コントローラのcreate必要ない


  #model User
  resources :users, only: [:index, :show, :create, :edit, :update]

  #model Book
  resources :books, only: [:index, :show, :create, :edit, :destroy]

end
