class CreateTypedPositionings < ActiveRecord::Migration
  def self.up
    create_table :typed_positionings do |t|
      t.integer   :location_id
      t.timestamps
    end    
    add_column :acts, :position_id, :integer
    add_column :acts, :position_type, :string    
  end

  def self.down
    drop_table :typed_positionings    
    remove_column :acts, :position_id
    remove_column :acts, :position_type
  end
end
