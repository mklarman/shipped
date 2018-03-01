Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 resources :users
 resources :boats
 resources :jobs


devise_scope :user do
  get '/', to: 'devise/sessions#new' 
   root  "devise/sessions#new"
end
end
