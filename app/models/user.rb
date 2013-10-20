class User < ActiveRecord::Base

  has_merit
	acts_as_voter

	extend FriendlyId
	friendly_id :user_name, :use => [:slugged, :finders]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates :first_name, :presence => true
	validates :user_name, :presence => true, :uniqueness => true
	validates :email, :presence => true, :uniqueness => true


	# User Avatar
	has_attached_file :avatar, styles: { mini: "32x32#", profile: "180x180#"},
										:default_url => 'https://s3.amazonaws.com/leagueio/design/user-profile/missing-image.png',
										:path => ":rails_root/public/system/:attachment/:id/:style/:filename",
										:url => "/system/:attachment/:id/:style/:filename"

	validates_attachment :avatar, content_type: { content_type: ['image/jpeg',
																															 'image/jpg',
																															 'image/png'] },
											 size: { less_than: 3.megabytes }


	# Relationships
	has_many :questions
	has_many :answers
	belongs_to :role


	before_create :set_default_role


	private

	def set_default_role
		self.role ||= Role.find_by_name('registered')
	end

end
