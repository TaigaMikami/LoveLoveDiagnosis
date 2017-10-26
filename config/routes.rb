Rails.application.routes.draw do

  get '/' => 'static_pages#top'
  get '/about' => 'static_pages#about'

  get 'photos/index' => 'photos#index'
  get 'photos/new' => 'photos#new'
  post 'photos/create' => 'photos#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
