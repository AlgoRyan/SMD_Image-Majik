class FriendshipsController < ApplicationController

before_filter :authenticate_user!

  def index
    @friends = current_user.friends
    @other_invited = current_user.pending_invited_by
    @you_invited = current_user.pending_invited
  end

  def new
    @users = User.where(["id != :this", {this: current_user.id}])
    @not_connected = Array.new()
    @users.each do |user|
      if current_user.connected_with? user
        # Do nothing
      else 
        @not_connected << user
      end
    end
  end

  def create
    invitee = User.find_by_id(params[:user_id])
    if current_user.invite invitee
      redirect_to new_friend_path, :notice => "Successfully invited user!"
    else
      redirect_to new_friend_path, :notice => "Sorry! You can't invite that user!"
    end
  end

  def update
    inviter = User.find_by_id(params[:id])
    if current_user.approve inviter
      redirect_to friends_path, :notice => "Successfully confirmed friendship!"
    else
      redirect_to friends_path, :notice => "Sorry! Could not confirm friendship!"
    end
  end

  def requests
    @pending_requests = current_user.pending_invited_by
  end

  def invites
    @pending_invites = current_user.pending_invited
  end

  def destroy
    user = User.find_by_id(params[:id])
    if current_user.remove_friendship user
      redirect_to friends_path, :notice => "Successfully removed friend!"
    else
      redirect_to friends_path, :notice => "Sorry, couldn't remove friend!"
    end
  end

end
