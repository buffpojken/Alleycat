class Story < ActiveRecord::Base

  belongs_to :user
  has_many :acts

  has_attached_file :icon, :styles => {:list_thumb => "60x60>"}
  
  validates :name, :presence => true

  def authored_by?(user)
    return self.user_id == user.id
  end

end
