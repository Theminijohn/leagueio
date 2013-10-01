Terora::Application.routes.draw do

  resources :questions do
		resources :answers
		member do
			get :upvote
			get :downvote
			get :selfvote
		end
	end

	root :to => 'pages#home'

  get 'get_started/welcome'
	get 'pages/home'
	get 'pages/tags'


  devise_for :users, :controllers => { :registrations => 'registrations' },
						 :path => '', :path_names => {:sign_in => 'login'}

	# User Profile
	get 'users/show'
	get 'user/:id' => 'users#show', as: :user

	# Tags
	get 'tags/:tag' => 'questions#index', as: :tag

	# Help
	get "help" => 'help#home', as: :help


end
