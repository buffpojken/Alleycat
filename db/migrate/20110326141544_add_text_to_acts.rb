class AddTextToActs < ActiveRecord::Migration
  def self.up
    add_column :acts, :content, :text
  end

  def self.down
    remove_column :acts, :content
  end
end
