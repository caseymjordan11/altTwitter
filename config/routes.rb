Rails.application.routes.draw do

  devise_for :users
  root to: 'tweets#index'

  resources :tweets do
    resources :replies, except: [:index]
  end


  resources :tweets, only: [:index, :show] do
    member do
      post 'add_favorite'
      delete 'remove_favorite'
    end
  end

  resources :users, only: [:show]

end
