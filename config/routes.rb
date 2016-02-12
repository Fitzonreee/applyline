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

  # Todo -------------------------
  # 1. create Job model
      # - save jobs to job model
  # 2. Be able to edit Jobs

  # Loose ends -------------------
  # 1. Change colors on responsive view
  # 2. Delete confirm PW from users table
  # 3. Add edit button to each panel

end
