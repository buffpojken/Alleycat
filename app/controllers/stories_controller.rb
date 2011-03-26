class StoriesController < ApplicationController
  layout 'application'
  

  def index

  end
  
  def list
    @stories = Story.find(:all)
  end

end
