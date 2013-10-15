ActiveAdmin.register User do

	before_filter do
		User.class_eval do
			def to_param
				id.to_s
			end
		end
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

end
