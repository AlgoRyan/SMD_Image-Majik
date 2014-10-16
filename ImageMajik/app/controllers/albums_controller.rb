class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def index
    @albums = Album.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(params[:id])
  end

  def create
    @album = Album.new(album_params)
    @album.user = current_user
    if @album.save
      redirect_to @album, notice: "New Album Created"
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @album = Album.find(params[:id])
    if @album.destroy
      redirect_to @album, notice: "Successfully Deleted"
    end
  end

  private
    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      temp = {"user_id" => current_user.id()}
      params.merge(temp)
      params.require(:album).permit(:title, :user_id)
    end
end
