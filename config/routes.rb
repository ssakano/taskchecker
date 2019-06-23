Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users
  end


   #トップページ(/)にアクセスした時、tasksコントローラのindexアクションに処理を流す。
  root to: 'tasks#index'
  resources :tasks
end
