class Act < ActiveRecord::Base

  belongs_to :story

  belongs_to :position, :polymorphic => true
  
  after_create :create_positioning
  
  def location=(data)
    self.position.update_attributes(data)
  end
  
  def resolve_position(position_data)
    return self.position.resolve(position_data)    
  end
  
  private
  
  def create_positioning
    case self.positioning
      when 'typed'
        self.position = TypedPositioning.create
        self.save
      end
  end

end
