Rails.application.routes.draw do
  # api definition
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :users, only: %i[show create update destroy]
    end
  end
end
