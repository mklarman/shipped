Rails.application.routes.draw do
 devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 
 
devise_scope :user do
  get '/', to: 'devise/sessions#new' 
end




 resources :users
 resources :boats
 resources :jobs

# <<<<<<< HEAD

# devise_scope :user do
#   get '/', to: 'devise/sessions#new' 
#    root  "devise/sessions#new"
# end
# =======
# >>>>>>> d92af28cf2fda760d99c8374ba759375cc45d630
# end

