ActiveAdmin.register Question do

	 index do
		 column :id
		 column :title
		 column :body
		 column :created_at
		 column :user
		 default_actions
	 end

end
