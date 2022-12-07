Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'courses#index'
  get "/courses", to: 'courses#index'
  get "/courses/new", to: 'courses#new'
  get "/courses/:id", to: 'courses#show'
  post '/courses', to: 'courses#create'
  get '/courses/:id/edit', to: 'courses#edit'
  post '/courses/:id/edit', to: 'courses#edit'
  patch '/courses/:id', to: 'courses#update'
  delete '/courses/:id', to: 'courses#destroy'
  
  root to: 'course_golfers#index'
  get "/courses/:course_id/golfers", to: 'course_golfers#index'
  get '/courses/:course_id/golfers/new', to: 'golfers#new'
  post '/courses/:course_id/golfers', to: 'golfers#create'
  patch '/courses/:course_id/golfers', to: 'course_golfers#update'

  root to: 'golfers#index'
  get "/golfers", to: 'golfers#index'
  get "/golfers/new", to: 'golfers#new'
  get "/golfers/:id", to: 'golfers#show'
  post "/golfers", to: 'golfers#create'
  get "/golfers/:id/edit", to: 'golfers#edit'
  patch '/golfers/:id', to: 'golfers#update'
  delete '/golfers/:id', to: 'golfers#destroy'
end