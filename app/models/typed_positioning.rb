class TypedPositioning < ActiveRecord::Base

  has_one :act, :as => :position
  
end
