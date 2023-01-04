Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'tokens/create'
    end
  end
  # api definition
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :users, only: %i[show index create update destroy]
      resources :tokens, only: %i[create destroy]
      resources :products
    end
  end
end
