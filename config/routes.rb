Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'courses#index'
  get "/courses", to: 'courses#index'
  get "/courses/:id", to: 'courses#show'

  root to: 'golfers#index'
  get "/golfers", to: 'golfers#index'
  get "/golfers/:id", to: 'golfers#show'
end
