Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/assign', to: "boats#assign"
  resources :users
  resources :boats
  resources :jobs

  # https://devhints.io/devise
  # unauthenticated do
  #   root :to => 'devise/sessions#new'
  # end
  # authenticated do
  #   root :to => 'users#show'
  # end

  # as :user do
  #   get 'sign_in', :to => 'devise/sessions#new'
  # end

  
 
  devise_scope :user do
    get '/', to: 'devise/sessions#new' 
    root  "devise/sessions#new"
  end
end


