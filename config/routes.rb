Diddleberry::Application.routes.draw do
  root to: 'Users#show'
  resources :users, only: [:edit, :update]
  resources :emails, only: [:create]
  resources :log_in_requests, only: [:new, :create]
  get "/e/:token" => 'UserSessions#create', as: :user_sessions
  get "/e/:token/remove" => 'emails#destroy', as: :remove_email
  get '/check_email' => 'Pages#check_email'
  get '/log_out' => 'UserSessions#destroy'
  get '/me/edit' => 'Users#edit', as: :edit_me
end
