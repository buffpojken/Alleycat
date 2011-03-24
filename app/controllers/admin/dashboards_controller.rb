class Admin::DashboardsController < ApplicationController
  layout 'admin'
  
  before_filter :login_required, :admin_required
  
  def show
    
  end

end
