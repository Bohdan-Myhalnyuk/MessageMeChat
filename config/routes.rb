Rails.application.routes.draw do
  root 'chatroom#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'session#destroy'
  post 'message', to: 'messages#create'
  mount ActionCable.server, at: '/cable'
end
