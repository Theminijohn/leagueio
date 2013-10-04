Terora::Application.routes.draw do

  resources :tags

  get "tags/show"
  resources :questions do
		resources :answers
		member do
			get :upvote
			get :downvote
		end
	end

	root :to => 'questions#index'

  get 'get_started/welcome'
	get 'pages/home'
	get 'pages/tags'

  devise_for :users, :controllers => { :registrations => 'registrations' },
						 :path => '', :path_names => {:sign_in => 'login'}

	# User Profile
	get 'users/show'
	get 'user/:id' => 'users#show', as: :user

	# Tags


	# Help
	get "help" => 'help#home', as: :help
	get 'help/asking' => 'help#asking'
	get 'help/answering' => 'help#answering'
	get 'help/reputation' => 'help#reputation'
	get 'help/account' => 'help#account'

end
