class GetStartedController < ApplicationController
  def welcome
		@user = current_user
	end

	def thanks
	end
end
