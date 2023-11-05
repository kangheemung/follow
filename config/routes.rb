Rails.application.routes.draw do
  #post 'authenticate', to: 'authentication#authenticate'#endpointを揃うため移動

  namespace :api do
    namespace :v1 do
      post 'auth'=>'auth#create'
      resources :users do
         resources :posts
      end
    end
  end
end
