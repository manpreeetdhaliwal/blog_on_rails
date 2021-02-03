Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get('/posts/new', to:"posts#new", as: :new_post)
  resources :posts do
    resources :comments, only:[:create, :destroy]
  end
  resources :users, only:[:new, :create]
  resource :session, only:[:new, :create, :destroy]
end
=begin
Rails.application.routes.draw do

  # resources :users, only: [:new, :create, :update, :edit]

  # resource :session, only: [:new, :create, :destroy]

  # #get('/user/:id/password/edit', { to: 'user#edit_password', as: :edit_password })

  # root "posts#index"

  get("/session", { to: "sessions#destroy", as: :session_destroy })

  get("/comments/:id", { to: "comments#destroy", as: :comment_destroy })

  # resources :posts do
  #   resources :comments, shallow: true, only: [:create, :destroy]
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get('/', { to: 'posts#index', as: 'root' })
  get('/users/:id/password/edit', { to: 'users#edit_password', as: 'edit_password' })
  patch('/users/:id/password/edit', { to: 'users#update_password', as: 'update_password'})
  
  resources :posts do
    resources :comments, shallow: true, only: [:create, :destroy]
  end
  resources :users, only: [:new, :create, :edit, :update]
  resource :session, only: [:new, :create, :destroy]
  
end
=end
