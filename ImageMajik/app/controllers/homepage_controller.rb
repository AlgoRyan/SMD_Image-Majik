class HomepageController < ApplicationController
  before_action :authenticate_user!, only: [:welcome]

  def welcome
  	@albums = Album.where(user_id: current_user.id)
    #@images = current_user.images
    #@comments = current_user.comments
    #@galleries = current_user.albums
  end

end
