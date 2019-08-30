Rails.application.routes.draw do
  get 'legacy', to: 'legacy#index'
  get 'home', to: 'home#index'
  get 'realistic', to: 'quiz#realistic'

  post 'verify', to: 'quiz#verify'
  get 'verify', to: 'quiz#redir'

  root 'quiz#realistic'
end
