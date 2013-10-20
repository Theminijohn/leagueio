class UpdatesController < ApplicationController

	before_action :set_update, only: [:show, :edit, :update, :destroy]
	load_and_authorize_resource

	def index
		@updates = Update.all.order("created_at DESC")
	end

	def show
	end

	def new
		@updates = Update.new
	end

	def edit
	end

	def create
		@update = Update.new(update_params)
		if @update.save
			redirect_to @update, notice: 'Update was successfully created.'
		else
			render action: 'new'
		end
	end

	def update
		if @update.update(update_params)
			redirect_to @update, notice: 'Update was successfully updated.'
		else
			render action: 'edit'
		end
	end

	def destroy
		@update.destroy
		redirect_to updates_url
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_update
		@update = Update.friendly.find(params[:id])
	end


	# Never trust parameters from the scary internet, only allow the white list through.
	def update_params
		params.require(:update).permit(:title, :body, :cover, :slug)
	end
end