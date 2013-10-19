class Update < ActiveRecord::Base

	validates :title, :presence => true
	validates :body, :presence => true
	# validates :cover, :presence => true

	# Cover
	has_attached_file :cover, styles: { cover: "870x200#" },
										:default_url => 'defulatpath.com',
										:path => ":rails_root/public/system/:attachment/:id/:style/:filename",
										:url => "/system/:attachment/:id/:style/:filename"

	validates_attachment :cover, content_type: { content_type: ['image/jpeg',
																															 'image/jpg',
																															 'image/png'] },
											 size: { less_than: 3.megabytes }


end
