class TypedPositioning < ActiveRecord::Base

  has_one :act, :as => :position
  belongs_to :location
  
  def resolve(position)
    fq = Foursquare2::Client.new(:client_id => configatron.fq_id, :client_secret => configatron.fq_sec)
    ven = fq.search_venues(:ll => position["coords"]["latitude"]+","+position["coords"]["longitude"])
    loq = []
    ven.groups.first.items.each do |fq_loc|
      if fq_loc.categories.first.id == location.foursquare_id
        loq.push fq_loc
      end
    end    
    return loq
  end
  
end
