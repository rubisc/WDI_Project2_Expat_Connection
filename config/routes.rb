Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#new'
  # USERS ROUTES BELOW =================================================
  #sign up page
  get '/users' => 'users#index'
  get '/users/new' => 'users#new', as: :new_user
  # create post when sign up form is submitted
  post '/users' => 'users#create'
  get '/users/:id/edit' => 'users#edit', as: :edit_user
  get '/users/:id' => 'users#show', as: :user
  patch 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'
  # LOGIN ROUTES BELOW =================================================
  # log in page with form:
  get '/login'     => 'sessions#new'
  # create (post) action for when log in form is submitted:
  post '/login'    => 'sessions#create'
  # delete action to log out:
  delete '/logout' => 'sessions#destroy'
# POST ROUTES BELOW =================================================
  # These were my post routes prior to adding comments and nesting routes
  # get '/posts' => 'posts#index'
  # get 'posts/new' => 'posts#new'
  # post '/posts' => 'posts#create'
  # get 'posts/:id' => 'posts#show', as: :post
  # get '/posts/:id/edit' => 'posts#edit', as: :edit_post
  # patch 'posts/:id' => 'posts#update'
  # delete 'posts/:id' => 'posts#destroy'
# NESTED COMMENT ROUTES BELOW =================================================
  resources :posts do
      resources :comments, except: [:index, :show]
  end

end
