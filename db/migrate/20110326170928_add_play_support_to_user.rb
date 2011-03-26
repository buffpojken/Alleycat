class AddPlaySupportToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :current_story_id, :integer
    add_column :users, :current_act, :integer
  end

  def self.down
    remove_column :users, :current_story_id
    remove_column :users, :current_act
  end
end
