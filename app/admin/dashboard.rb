ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do


		panel "Recent Users" do
			table_for User.order("created_at desc").limit(10) do
				column :id
				column :email
				column :user_name do |u|
					link_to u.user_name, [:admin, u]
				end
				column :points
				column :sign_in_count
				column :created_at
			end
			strong { link_to "View all Users", admin_users_path }
		end

		panel "Recent Questions" do
			table_for Question.order("created_at desc").limit(10) do
				column :id
				column :title do |q|
					link_to q.title, [:admin, q]
				end
				column "Votes", :votes_count
				column :user
				column :created_at
			end
			strong { link_to "View all Questions", admin_questions_path }
		end


  end
end
