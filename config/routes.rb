Rails.application.routes.draw do
  resources :epidural_requests
  resources :testforms
  resources :rooms
  resources :room_allocations
  resources :follow_ups
  resources :patients

  resources :anaesthetics do
    resource :patients
  end
  get 'all_anaesthetics', to: 'anaesthetics#all_anaesthetics'
  resources :patients do
    resources :anaesthetics
    resources :follow_ups
    resources :epidural_requests
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'patients#index'
end
