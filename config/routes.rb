Terora::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


	root :to => 'questions#index'

  resources :tags
	resources :updates

  get "tags/show"
  resources :questions do
		resources :answers do
		  member do
			  get :upvote
			  get :downvote
				get :accept_toggle
			end
		end
		member do
			get :upvote
			get :downvote
		end
	end

  get 'get_started/welcome'
	get 'pages/home'
	get 'pages/tags'
	get "about/home"

  devise_for :users, :controllers => { :registrations => 'registrations' },
		:path => '', :path_names => {:sign_in => 'login'}

	# User Profile
	get 'users/show'
	get 'user/:id' => 'users#show', as: :user


	# Help
	get "help" => 'help#home', as: :help
	get 'help/asking' => 'help#asking'
	get 'help/answering' => 'help#answering'
	get 'help/reputation' => 'help#reputation'
	get 'help/account' => 'help#account'

	# About
	get "about" => 'about#home'

	# Error Pages
	get "errors/error_404"
	get "errors/error_500"

	unless Rails.application.config.consider_all_requests_local
		get '*not_found', to: 'errors#error_404'
	end

end
