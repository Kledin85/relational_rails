Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'courses#index'
  get "/courses", to: 'courses#index'
  get "/courses/new", to: 'courses#new'
  get "/courses/:id", to: 'courses#show'
  get "/courses/:course_id/golfers", to: 'course_golfers#index'
  post '/courses', to: 'courses#create'
  get '/courses/:id/edit', to: 'courses#edit'
  post '/courses/:id/edit', to: 'courses#edit'
  patch '/courses/:id', to: 'courses#update'

  root to: 'golfers#index'
  get "/golfers", to: 'golfers#index'
  get "/golfers/:id", to: 'golfers#show'
end