class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string    :name 
      t.string    :icon_url 
      t.string    :parent_location_id
      t.string   :foursquare_id
      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
