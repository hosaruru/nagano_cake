Rails.application.routes.draw do
  namespace :admin do
    get '' => 'homes#top'
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end
  namespace :public do
    post 'orders' => 'orders#create'
    get 'orders' => 'orders#index'
    get 'orders/new'
    post 'orders/confirm'
    post 'orders/complete'
resources :orders, only: [:show]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all_item'
    delete 'cart_items/:id' => 'cart_items#destroy', as: 'destroy_item'
    patch 'cart_items/update/:id' => 'cart_items#update', as: 'update_item'
    get 'cart_items/index'
    get 'cart_items/create'

    get 'cart_items' => 'cart_items#index'
    post 'cart_items' => 'cart_items#create'
    get 'cart_items/:id/edit' => 'cart_items#edit', as: 'edit_item'
    get 'cart_items/:id' => 'cart_items#show'
  
    patch 'addresses/:id' => 'addresses#update', as: 'update_address'
    delete 'addresses/:id' => 'addresses#destroy', as: 'destroy_address'
    get 'addresses' =>  'addresses#index'
    post 'addresses' => 'addresses#create'
    get 'addresses/update'
    get 'addresses/:id/edit' => 'addresses#edit', as: 'edit_address'
  end


# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  namespace :public do
    patch 'customers/withdraw'
    patch 'customers/:id' => 'customers#update', as: 'update_customer'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/new'
    get 'customers/unsubscribe'

  end
  root to: 'public/homes#top'
  namespace :public do
    get 'items' => 'items#index'
    get 'items/:id' => 'items#show'
    get 'items' => 'items#show'
  end
  namespace :public do
    get 'homes/top'
    get '/about' => 'homes#about', as: 'about'
  end
  namespace :admin do
    patch 'customers/:id' => 'customers#update', as: 'update_customer'
    get 'customers' => 'customers#index'
    get 'customers/:id' => 'customers#show'
    get 'customers/:id/edit' => 'customers#edit', as: 'customer'
  end
  namespace :admin do
    patch 'items/:id' => 'items#update', as: 'update_item'
    get 'items' => 'items#index'
    get 'items/new'
    get 'items/create'
    post 'items' => 'items#create'
    get 'items/:id' => 'items#show'
    get 'items/:id/edit' => 'items#edit', as: 'edit_item'
    get 'items/update'
  end
  namespace :admin do
    patch 'genres/:id' => 'genres#update', as: 'update_genre'
    get "genres" =>  'genres#index'
    resources :genres, only: [:new, :create, :show]
    post 'genres' => 'genres#create'
    get 'genres/:id/edit' => 'genres#edit', as: 'edit_genre'
    get 'genres/:id' => 'genres#show'
  end
  
  namespace :public do
    patch 'genres/:id' => 'genres#update', as: 'update_genre'
    resources :genres, only: [:index, :new, :create, :update]
    post 'genres' => 'genres#create'
    get 'genres/:id/edit' => 'genres#edit', as: 'edit_genre'
    get 'genres/:id' => 'genres#show'
  end


end
