class SplashController < ApplicationController

  def default
    if user_signed_in?
      redirect_to homepage_path
    end
  end

end