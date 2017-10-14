Rails.application.routes.draw do

  resources :wikis
  resources :charges, only: [:new, :create]

 devise_for :users,skip: [:sessions]
 as :user do
  get 'signin', to: 'devise/sessions#new', as: :new_user_session
  post 'signin', to: 'devise/sessions#create', as: :user_session
  delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'welcome#landing'
end
