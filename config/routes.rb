Rails.application.routes.draw do
  # api definition
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :users, only: %i[show index create update destroy]
      resources :tokens, only: %i[create destroy]
      resources :products
      resources :orders, only: %i[index show create]
    end
  end
end
