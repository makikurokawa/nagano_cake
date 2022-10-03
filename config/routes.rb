Rails.application.routes.draw do
  root to: "public/homes#top"
  get 'homes/about' => 'homes#about', as: 'about'

  devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


  devise_for :admins, controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    get '/' => 'admin/homes#top'

    resources :items, only: [:create, :new, :index, :show, :edit, :update]
    resources :genres, only: [:create, :index, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
