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

  # all auth and user handling is done with Devise
  devise_for :users

  root 'patients#index'
end
