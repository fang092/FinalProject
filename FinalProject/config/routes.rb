Rails.application.routes.draw do

  get 'users/new'

  root  'static_pages#home'

  get 'login' => 'static_pages#login'

  get 'signup'  => 'users#new'

  get 'draftpicks' => 'static_pages#draftpicks'

  get 'picklist' => 'static_pages#picklist'

  resources :users
end
