Rails.application.routes.draw do
  resources :items
  resources :attendees, except: [:index, :show]
  get '/attendees', to: 'attendees#index', as: 'home_page'
  get '/attendees/:id', to: 'attendees#show', as: 'showtime'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
