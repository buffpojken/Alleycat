class CreateActs < ActiveRecord::Migration
  def self.up
    create_table :acts do |t|
      t.integer   :story_id
      t.string    :name
      t.string    :act_key
      t.string    :positioning      
      t.timestamps
    end
  end

  def self.down
    drop_table :acts
  end
end
