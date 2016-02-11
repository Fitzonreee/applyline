Rails.application.routes.draw do

  root 'jobs#index'
  # root 'users#index'

  get 'jobs/show'

end
