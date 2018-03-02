Rails.application.routes.draw do
 devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 
 
devise_scope :user do
  get '/', to: 'devise/sessions#new' 
end




 resources :users
 resources :boats
 resources :jobs


end
