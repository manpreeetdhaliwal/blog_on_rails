Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get('/posts/new', to:"posts#new", as: :new_post)
  resources :posts do
    resources :comments, only:[:create, :destroy]
  end
end
