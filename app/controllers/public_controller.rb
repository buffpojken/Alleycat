class PublicController < ApplicationController
  layout 'sessions'

  
  
  def login
    if params[:code]
      self.current_user = User.connect_by_code(params[:code])
      redirect_to '/stories/list' and return
    else
      render :nothing => true, :status => 404 and return
    end
  end

  # Admin

  def admin;end

  def connect    
    if MiniFB.verify_cookie_signature(configatron.fb_id, configatron.fb_sec, cookies)
      fb_info = MiniFB.parse_cookie_information(configatron.fb_id, cookies)      
      self.current_user = User.connect(fb_info)
      if @current_user.admin? 
        redirect_to '/admin/dashboard' and return 
      else
        redirect_to '/stories/list' and return
      end
    else
      flash[:error] = "Someone has tampered with this cookie."
      redirect_to :back and return       
    end  
  end
  
  def logout
    session.delete('user_id')
    @current_user = nil
    redirect_to '/' and return 
  end

end
