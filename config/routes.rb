Rails.application.routes.draw do
  devise_for :customers
    namespace :customer do
        resources :orders, only: [:new, :thanks, :show, :create, :index, :purchase]
        resources :customers, only: [:show, :edit, :update, :destroy_confirm, :destroy]
        resources :cart_products, only: [:index, :create, :update, :destroy, :destroy_all]
        resources :products, only: [:index, :show]
        resources :deliveries, only: [:index, :create, :edit, :update, :destroy]
    end

        

    namespace :admin do
        root 'admins#top'
        resources :products, :genres
        resources :orders, only: [:index, :show, :update]
        resources :customers, only: [:index, :show, :edit, :update]
    end


end