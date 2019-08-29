Rails.application.routes.draw do
  get 'legacy', to: 'legacy#index'
  get 'home', to: 'home#index'
  get 'realistic', to: 'quiz#realistic'

  root 'quiz#realistic'
end
