class Admin::StoriesController < ApplicationController
  layout 'admin'

  before_filter :login_required, :admin_required

  def index
    @stories = Story.find(:all)
  end
  
  def mine
    @stories = Story.find(:all, :conditions => ["user_id = ?", @current_user.id])
    render :template => "admin/stories/index" and return
  end
  
  def new;@story = Story.new;end
  
  def create
    @story = Story.create(params[:story].merge({:user_id => @current_user.id}))
    if @story && @story.errors.empty? 
      redirect_to admin_story_acts_path(@story) and return
    else
      render :action => :new and return
    end
  end
  
  
  def delete_act
    @story = Story.find(params[:id])
    act = @story.acts.find_by_id(params[:act_id])
    if act && act.destroy
      flash[:notice] = "Act deleted"
    else
      flash[:error] = "Could not delete act"
    end
    redirect_to :back and return
  end

end
