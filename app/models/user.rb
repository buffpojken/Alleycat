class User < ActiveRecord::Base

  
  attr_accessible :name, :fb_uid, :fb_access_token, :email, :current_story_id, :current_act

  before_create :check_if_admin
  
  has_many :stories
  
  has_one :current_story, :class_name => "Story"
  
  # Stories
  
  def start_to_play(story)
    return self.update_attributes(:current_story_id => story.id, :current_act => 0)
  end
  
  
  # Login / Authentication

  def self.connect_by_code(code)
    access_token_hash = MiniFB.oauth_access_token(configatron.fb_id, "http://"+configatron.base_url+"/public/login", configatron.fb_sec, code)
    logger.info access_token_hash
    fb = MiniFB::OAuthSession.new(access_token_hash['access_token'], 'en_US')
    me = fb.me
    u = self.find_by_fb_uid(me.id)
    if u 
      u
    else
      u = self.create(:fb_uid => me.id, :fb_access_token => access_token_hash['access_token'], :name => me.name, :email => me.email)
      logger.info u.inspect
      logger.info u.errors.inspect
      if u && u.errors.empty? 
        u
      else
       nil 
      end      
    end
  end

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
