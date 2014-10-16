class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :set_album, only: [:index, :new, :create]

  def index
    @images = Image.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @image = Image.new
  end

  def edit
    @image = Image.find(params[:id])
  end

  def create
    @image = Image.new(image_params)
    @image.album = @album
    if @image.save
      redirect_to @image, notice: "New Image Created"
    else
      render :new
    end
  end

  def update
    @image.update(image_params)
  end

  def destroy
    @image = Image.find(params[:id])
    if @image.destroy
      redirect_to @album, notice: "Successfully Deleted"
    end
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def set_album
      @album = Album.find(params[:album_id])
    end

    def image_params
      params.require(:image).permit(:label, :caption)
    end
end
