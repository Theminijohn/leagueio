class AddSluggToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :slug, :string
		add_index :updates, :slug
  end
end
