class StoriesController < ApplicationController
  layout 'application'
  
  before_filter :login_required, :except => [:index, :login]

  def index

  end
  
  def list
    @stories = Story.find(:all)
  end

  def show
    @story = Story.find(params[:id])
  end

  def start_play
    @story = Story.find(params[:id])
    if @current_user.start_to_play(@story)
      redirect_to play_story_path(@story) and return
    else
      flash[:error] = "Could not start to play this story - try another?"
      redirect_to error_story_path(@story) and return
    end
  end
    
  def play
    
  end
  
  def locations
    @story    = Story.find(params[:id])    
    if @story.acts.length == @current_user.current_act
      # Handle end of story here... .daniel
    else
      @act      = @story.acts[@current_user.current_act]    
      logger.info @act.inspect
      response  = @act.resolve_position(params["location"])
      render :text => response.to_json and return      
    end
  end

end
