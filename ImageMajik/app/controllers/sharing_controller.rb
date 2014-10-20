class SharingController < ApplicationController
  before_action :authenticate_user!

  def new
  	@image = Image.find_by_id(params[:image_id])
  	@shareable_with = current_user.friends
  end

  def create
    image = Image.find_by_id(params[:image_id])
    user = User.find_by_id(params[:user_id])
    if image.share_with(current_user, user)
      redirect_to share_path, :notice => "Successfully shared image!"
    else
      redirect_to share_path, :notice => "Sorry! Unable to share image with that user!"
    end
  end

  def destroy
    # user = Image.find_by_id(params[:user_id])
    # if current_user.remove_friendship user
    #   redirect_to friends_path, :notice => "Successfully removed friend!"
    # else
    #   redirect_to friends_path, :notice => "Sorry, couldn't remove friend!"
    # end
  end

end
