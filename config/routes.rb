Rails.application.routes.draw do

  # root 'jobs#index'

  # User Register / Login / Logout Routes
  get '/' => 'users#index'
  post 'register' => 'users#create'
  post 'login' => 'users#login'
  get 'logout' => 'users#logout'

  # Jobs Routes
  get 'welcome' => 'jobs#index'
  post 'add_job' => 'jobs#add'


  # Routes not currently utilized
  get 'jobs/show'

end
