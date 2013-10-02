class AddLolkingLinkToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lolking_link, :string
  end
end
