Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  # good job using a custom controller for sign-up
  root to: 'tweets#index'

  resources :tweets do
    resources :replies, except: [:index]
    member do
      post 'add_favorite'
      delete 'remove_favorite'
    end
    # I think you can just include your member routes in the original resources for tweets
    # (constraining them to index and show isn't affecting them)
  end



  resources :users, only: [:show]

  resources :users do
    member do
      get :following, :followers
  end

  # The same goes for above; the first line only sets up a show route, but then the second resources users
  # sets up all the rest of them anyways
end

  resources :relationships


end
