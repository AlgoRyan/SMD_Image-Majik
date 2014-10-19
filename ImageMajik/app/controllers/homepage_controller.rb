class HomepageController < ApplicationController
  before_action :authenticate_user!, only: [:welcome]

  def welcome
  	@albums = Album.where(user_id: current_user.id)
    @friends = current_user.friends
  end

end
