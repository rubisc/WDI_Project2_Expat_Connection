Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#new'
  #sign up page
  get 'users/new' => 'users#new', as: :new_user
  # create post when sign up form is submitted
  post 'users' => 'users#create'
  # log in page with form:
  get '/login'     => 'sessions#new'
  # create (post) action for when log in form is submitted:
  post '/login'    => 'sessions#create'
  # delete action to log out:
  delete '/logout' => 'sessions#destroy'
  # WHAT ABOUT MY ABOUT PAGE?! PART OF ROOT USERS#NEW...MAYBE
  get '/posts' => 'posts#index'
  get 'posts/new' => 'posts#new'
end
