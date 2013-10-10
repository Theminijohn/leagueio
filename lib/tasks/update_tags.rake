namespace :db do
	desc "Update all tags with category ids"
	task :update_tags => :environment do
    i =+ 150
    c =+ 1

    tags = Tag.where('id <= ?', i)
    if tags.any?
    	tags.update_all(cat_id: c)
    end
	end
end