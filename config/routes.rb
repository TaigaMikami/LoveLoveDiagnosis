Rails.application.routes.draw do


  get '/' => 'static_pages#top'
  get '/about' => 'static_pages#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end