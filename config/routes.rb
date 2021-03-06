Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:index, :show]
  resources :rooms, :only => [:create, :show, :index]
  resources :messages, :only => [:create]
  
  root to: "portfolios#index"

  resources :portfolios do
    resources :comments, only: :create
  end
  #get 'portfolios/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

put 'users/follow/:user_id' => 'users#follow'
put 'users/unfollow/:user_id' => 'users#unfollow'
#フォローとフォローを外すアクション

get 'users/follow_list/:user_id' => 'users#follow_list'
get 'users/follower_list/:user_id' => 'users#follower_list'
#フォロー・フォロワーの一覧ページ

get 'portfolios/search'
match '/portfolios',  to: 'portfolios#index', via: 'get'

end


