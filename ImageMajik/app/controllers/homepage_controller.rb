class HomepageController < ApplicationController
  before_action :authenticate_user!, only: [:welcome]

  def welcome
    #@images = current_user.images
    #@comments = current_user.comments
    #@galleries = current_user.albums
    
  end

end
