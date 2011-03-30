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

end
