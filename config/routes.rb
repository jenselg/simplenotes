Rails.application.routes.draw do
  resources :notes
  resources :dateys
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated :user do
    root 'private_pages#index', as: 'auth_root'
  end
  
  root 'public_pages#index'
  
  post '/finish', to: 'notes#finish', as: 'finish'
  
end
