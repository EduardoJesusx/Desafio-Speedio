Rails.application.routes.draw do
  resources :scrapers

  post '/save_info', to: 'scrapers#save_info', defaults: { format: :json }
  get '/get_info', to: 'scrapers#get_info', defaults: { format: :json }
end
