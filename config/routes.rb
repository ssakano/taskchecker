Rails.application.routes.draw do
   #トップページ(/)にアクセスした時、tasksコントローラのindexアクションに処理を流す。
  root to: 'tasks#index'
  
  resources :tasks
end
