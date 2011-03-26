class Admin::ActsController < ApplicationController
  layout 'admin'
  
  before_filter :login_required, :admin_required
  
  protect_from_forgery :except => [:update]

  def index
    @story      = Story.find(params[:story_id])
    @locations  = Location.find_all_by_parent_location_id(nil)
  end
  
  def create
    @story      = Story.find(params[:story_id])
    @act = @story.acts.create(params[:act])
    if @act && @act.errors.empty? 
      flash[:notice] = "Act added"
    else
      flash[:error] = "Could not add act"
    end
    redirect_to :action => :index and return
  end
  
  def update
    @story      = Story.find(params[:story_id])
    @act        = @story.acts.find(params[:id])
    if @act.update_attributes(params[:act]) && @act.position.update_attributes(params[:position])
      render :nothing => true, :status => 200 and return      
    else
      render :nothing => true, :status => 500 and return
    end      
  end
  
  def destroy
    act = Act.find(params[:id])
    if act.destroy
      flash[:notice] = "Act destroyed"
    else
      flash[:error] = "Could not delete act"
    end
    redirect_to :action => :index and return
  end
  
end
