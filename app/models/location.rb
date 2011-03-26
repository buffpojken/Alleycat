class Location < ActiveRecord::Base

  belongs_to :parent_location, :class_name => "Location"
  
  has_many :locations, :foreign_key => 'parent_location_id', :class_name => "Location"

end
