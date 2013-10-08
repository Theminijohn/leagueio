class Answer < ActiveRecord::Base

	acts_as_votable

	belongs_to :user
	belongs_to :question

	validates :body, :presence => true
	validates :question_id, :presence => true
	validates :user_id, :presence => true

	def owner?(user)
		if self.user_id == user.id
		  return true
		 else
		 	return false
    end
	end
end
