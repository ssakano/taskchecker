Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end


   #トップページ(/)にアクセスした時、tasksコントローラのindexアクションに処理を流す。
  root to: 'tasks#index'
  resources :tasks
end
