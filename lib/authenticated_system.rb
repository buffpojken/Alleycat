module AuthenticatedSystem
  
  def login_required
    u = User.find_by_id(session[:user_id])
    unless u
      redirect_to '/' and return
    else
      self.current_user = u
    end
  end
  
  def admin_required
    unless @current_user.admin?
      redirect_to '/' and return
    end
  end

  def current_user=(user)
    session[:user_id] = user.id
    @current_user = user
  end
  
end