class ChangeIdColumnType < ActiveRecord::Migration
  def self.up
    change_column :locations, :parent_location_id, :integer
  end

  def self.down
    change_column :locations, :parent_location_id, :string
  end
end
