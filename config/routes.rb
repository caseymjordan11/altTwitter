Rails.application.routes.draw do

  root to: 'tweets#index'

  resources :tweets do
    resources :replies, except: [:index]
  end

end
