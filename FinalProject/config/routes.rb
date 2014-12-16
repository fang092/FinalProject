Rails.application.routes.draw do
  root                'static_pages#home'
  get 	 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'draft'   => 'picks#new'
  get    'roster'  => 'picks#roster'
  post   'picks'   => 'picks#create'
  resources :users
  resources :picks
end
