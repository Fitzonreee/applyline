Rails.application.routes.draw do

  # root 'jobs#index'

  # User Register / Login / Logout Routes
  post 'register' => 'users#create'
  post 'login' => 'users#login'
  get 'logout' => 'users#logout'

  get '/' => 'users#index'
  get 'welcome' => 'jobs#index'



  get 'jobs/show'

end
