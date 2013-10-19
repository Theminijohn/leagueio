class ApplicationController < ActionController::Base

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_url
	end

	before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) do |u|
			u.permit(:email, :password, :password_confirmation, :first_name,
							 :last_name, :user_name, :role)
		end
		devise_parameter_sanitizer.for(:account_update) do |u|
			u.permit(:email, :password, :password_confirmation, :first_name,
							 :last_name, :facebook_link, :twitter_link, :website, :user_name,
							 :avatar, :lolking_link, :role)
		end
	end

	unless Rails.application.config.consider_all_requests_local
		rescue_from Exception, with: lambda { |exception| render_error 500, exception }
		rescue_from ActionController::RoutingError,
								ActionController::UnknownController,
								::AbstractController::ActionNotFound,
								ActiveRecord::RecordNotFound, with: lambda { |exception| render_error 404, exception }
	end

	private
	def render_error(status, exception)
		respond_to do |format|
			format.html { render template: "errors/error_#{status}", layout: 'layouts/errors', status: status }
			format.all { render nothing: true, status: status }
		end
	end

end
