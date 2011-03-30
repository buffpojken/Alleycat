class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.integer   :user_id
      t.string    :name
      t.text      :description
      t.boolean   :published, :default => false
      t.string    :icon_file_name
      t.string    :icon_content_type
      t.integer   :icon_file_size
      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end
