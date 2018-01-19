Rails.application.routes.draw do
	root "pages#home"
	get 'pages/home', to: 'pages#home'
	resources :recettes do
	   resources :commentaires, only: [:create,:destroy]
	end

	get '/signup', to:"chefs#new"
	resources :chefs, except: [:new]
	get '/login', to:"sessions#new"
	post '/login',to:"sessions#create"
	delete '/logout', to:"sessions#destroy"
	resources :ingredients

	mount ActionCable.server => '/cable'
end
