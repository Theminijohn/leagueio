class User < ActiveRecord::Base
  has_merit

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates :first_name, :presence => true
	validates :user_name, :presence => true, :uniqueness => true
	validates :email, :presence => true, :uniqueness => true


	# User Avatar
	has_attached_file :avatar, styles: { medium: "320x240",
																			 mini: "32x32#",
																			 profile: "256x256"}

	validates_attachment :avatar, content_type: { content_type: ['image/jpeg',
																															 'image/jpg',
																															 'image/png'] },
											 size: { less_than: 3.megabytes }


	# Realtionships
	has_many :questions, :dependent => :destroy
	has_many :answers

	acts_as_voter

	def to_param
		user_name
	end

end
