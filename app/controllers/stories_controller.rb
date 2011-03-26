class StoriesController < ApplicationController
  layout 'application'
  

  def index

  end
  
  def list
    @stories = Story.find(:all)
  end

  def show
    @story = Story.find(params[:id])
  end

  def play
    @story = Story.find(params[:id])
    render :text => "start implementing here..."
  end

end
