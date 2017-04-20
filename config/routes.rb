Rails.application.routes.draw do
  get 'users/show'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :orgs do
    get 'dashboard'
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  authenticated :user do
    root 'pages#dashboard', as: :authenticated_root
  end

  root 'pages#home'

  get 'pages/contact'

  get 'pages/about'

  get 'pages/dashboard'

  get 'orgs/dashboard'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
