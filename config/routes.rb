Rails.application.routes.draw do
  resources :recalls
  resources :products
  resources :medical_devices
  resources :foods
  resources :drugs
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
