Rails.application.routes.draw do
  resources :sightings
  get "/birds" => "birds#index"
  # get "/birds/:id" => "birds#show"
  get '/sights' => 'sightings#index'
end
