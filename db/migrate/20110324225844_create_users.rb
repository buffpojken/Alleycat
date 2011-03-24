class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :name
      t.integer   :fb_uid
      t.string    :fb_access_token
      t.string    :email
      t.integer   :admin, :default => false      
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
