class AddAttachmentCoverToUpdates < ActiveRecord::Migration
  def self.up
    change_table :updates do |t|
      t.attachment :cover
    end
  end

  def self.down
    drop_attached_file :updates, :cover
  end
end
