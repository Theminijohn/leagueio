class UsersController < ApplicationController

	before_filter :authenticate_user!

	def show
		@user = User.find(params[:id])  # For Name instead of ID
	end

end
