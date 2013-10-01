class Question < ActiveRecord::Base
	is_impressionable
	acts_as_votable

	belongs_to :user
	has_many :answers

  has_many :taggings
  has_many :tags, through: :taggings

	validates :title, :presence => true
	validates :body, :presence => true
	validates :user_id, :presence => true
	validates :tags, :presence => true

	def owner?(user)
		if self.user_id == user.id
		  return true
		 else
		 	return false
    end
	end

  def self.tagged_with(name)
    Tag.find_by_name!(name).questions
  end

  def tag_list
    tags.map(&:name)
  end

  def tag_with(tags)
  	old_tags = self.tags.pluck(:name).unshift("")
  	unless old_tags == tags # if tags were not updated no action will be done.
	  	self.tags.delete_all
	  		# code here (in the future)
	  	tags.map do |n|
	    	tag = Tag.where(name: n.strip).first
	    	if tag.present?
	    		tagging = Tagging.find_or_create_by_tag_id_and_question_id(tag.id, self.id)
	    	  #Tagging.create(tag_id: tag.id, question_id: self.id)
	    	end
	 	  end
	 	end
  end

  def tag_list=(names)
  	self.tags = names.split(",").map do |n|
    	Tag.where(name: n.strip).first!
 	  end
  end
end
