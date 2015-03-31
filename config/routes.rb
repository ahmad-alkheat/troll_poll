Rails.application.routes.draw do

  root 'statics#welcome'

  get '/welcome', controller: "statics", action: "welcome"

  devise_for :users
  resources :polls do
    resources :questions, except: [:show]
    resources :replies, only: [:new, :create]
  end

end
