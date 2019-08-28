Rails.application.routes.draw do
  get 'legacy', to: 'legacy#index'
  get 'home', to: 'home#index'

  root 'home#index'
end
