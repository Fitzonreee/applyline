Rails.application.routes.draw do

  # root 'jobs#index'
  # root 'users#index'

  get 'welcome' => 'users#index'
  get 'pipeline' => 'jobs#index'


  get 'jobs/show'

end
