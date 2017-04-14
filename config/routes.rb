Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'pages#dashboard', as: :authenticated_root
  end

  root 'pages#home'

  get 'pages/contact'

  get 'pages/about'

  get 'pages/dashboard'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
