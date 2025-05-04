Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :recipes
  root "recipes#index"
end