class AddCatIdToTags < ActiveRecord::Migration
  def change
    add_column :tags, :cat_id, :integer
  end
end
