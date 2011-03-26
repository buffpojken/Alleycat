class TypedPositioning < ActiveRecord::Base

  has_one :act, :as => :position
  belongs_to :location
  
end
