Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/facebook', to: 'facebook#home'
  get '/tweets', to: 'tweets#home'
end
