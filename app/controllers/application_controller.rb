class ApplicationController < ActionController::Base

	before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) do |u|
			u.permit(:email, :password, :password_confirmation, :first_name,
							 :last_name, :user_name)
		end
		devise_parameter_sanitizer.for(:account_update) do |u|
			u.permit(:email, :password, :password_confirmation, :first_name,
							 :last_name, :facebook_link, :twitter_link, :website, :user_name,
							 :avatar, :lolking_link)
		end
	end

end
