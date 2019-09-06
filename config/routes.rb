Rails.application.routes.draw do
  devise_for :users
  
  get 'legacy', to: 'legacy#index'
  get 'home', to: 'home#index'

  get 'realistic', to: 'quiz#realistic'
  post 'realistic', to: 'quiz#verify'
  get 'reset', to: 'quiz#reset'

  root 'home#index'
end
