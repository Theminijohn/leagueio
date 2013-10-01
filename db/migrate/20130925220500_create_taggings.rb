class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.belongs_to :tag
      t.belongs_to :question

      t.timestamps
    end
    add_index :taggings, :tag_id
    add_index :taggings, :question_id
  end
end
