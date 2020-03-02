Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
    }
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations'
    }

    namespace :customer do
        resources :orders, only: [:new, :show, :create, :index]
        resources :customers, only: [:show, :edit, :update,:destroy]
        resources :cart_products, only: [:index, :create, :update, :destroy]
        resources :products, only: [:index, :show] do
            resources :reviews
        end
        resources :deliveries, only: [:index, :create, :edit, :update, :destroy]
        
    end
    root "products#index"
    get "thanks" => "customer/orders#thanks" #customers sが余計についてました。
    delete "/destroy_all" => "customer/cart_products#destroy_all"
    get "/destroy_confirm/:id" => "customer/customers#destroy_confirm",as: "destroy_confirm"
    post "/purchase" => "customer/orders#purchase" #getからpostに変更


    namespace :admin do
        root "admin#top"
        resources :products
        resources :genres, only: [:index, :create, :edit, :update, :destroy]
        resources :orders, only: [:index, :show, :update]
        resources :customers, only: [:index, :show, :edit, :update]
    end
    


end 
