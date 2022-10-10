Rails.application.routes.draw do
  root to: "public/homes#top"
  get '/about' => 'public/homes#about', as: 'about'

  devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

 scope module: :public do
  get 'customers/my_page' => 'customers#show'
  get 'customers/infomation/edit' => 'customers#edit'
  resources :customers, only: [:update, :confirm, :destroy]
 end

  resources :items, only: [:index, :show]

  resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]


  devise_for :admins, controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    get '/' => 'homes#top'

    resources :items, only: [:create, :new, :index, :show, :edit, :update]
    resources :genres, only: [:create, :index, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
