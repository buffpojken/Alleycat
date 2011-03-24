class User < ActiveRecord::Base

  
  attr_accessible :name, :fb_uid, :fb_access_token, :email

  before_create :check_if_admin


  def self.connect(info)
    u = self.find_by_fb_uid(info['uid'])
    if u
      u
    else
      fb = MiniFB::OAuthSession.new(info['access_token'], 'en_US')
      me = fb.me
      u = self.create(:fb_uid => info['uid'], :fb_access_token => info['access_token'], :name => me.name, :email => me.email)
      if u && u.errors.empty? 
        u
      else
       nil 
      end
    end
  end
  
  private
  
  def check_if_admin
    self.admin = true if self.fb_uid = "1521128989"
  end


end
