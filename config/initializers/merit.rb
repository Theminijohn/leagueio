# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongo_mapper and :mongoid
  config.orm = :active_record

  # Define :user_model_name. This model will be used to grand badge if no :to option is given. Default is "User".
  config.user_model_name = "User"

  # Define :current_user_method. Similar to previous option. It will be used to retrieve :user_model_name object if no :to option is given. Default is "current_#{user_model_name.downcase}".
  config.current_user_method = "current_user"

	# Don't allow Score to sub-zero
	module Merit
		class Score < ActiveRecord::Base
			class Point < ActiveRecord::Base
				after_save :floor_on_zero

				private

				def floor_on_zero
					return if score.sash.points >= 0
					point = Merit::Score::Point.new
					point.num_points = -score.sash.points
					point.log = 'Flooring on zero'
					point.score_id = score_id
					point.save
				end
			end
		end
	end

end

Merit::Badge.create! ({
	id: 1,
	name: "beta-tester",
	image: "http://findicons.com/files/icons/494/pioneer_camp/48/badge.png",
	description: "Signed up for the Closed Beta"
})

