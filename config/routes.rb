Rails.application.routes.draw do
	resources :users, only: [:index, :show, :create]
  	post '/sign-in' => 'sessions#create'
  	get '/sign-out' => 'sessions#destroy'
  	get '/welcome/index'
end
