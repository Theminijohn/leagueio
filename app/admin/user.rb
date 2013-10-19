ActiveAdmin.register User do

	before_filter :only => [:show, :edit, :update, :destroy] do
		@user = User.find_by_user_name(params[:id])
	end


	index do
		column :id
		column :email
		column :user_name do |u|
			link_to u.user_name, [:admin, u]
		end
		column :sign_in_count
		column :created_at
		default_actions
	end

	controller do
		def permitted_params
			params.permit user: [:email, :password, :password_confirmation, :role, :role_id]
		end
	end

end
