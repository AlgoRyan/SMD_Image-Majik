class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :set_album, only: [:index, :new, :create]

  def index
    @images = Image.where(user_id: current_user.id)
  end

  def show
    @image = Image.find(params[:id])
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
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @image = Image.find(params[:id])
    if @image.destroy
      redirect_to @image.album, notice: "Successfully Deleted"
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
      params.require(:image).permit(:label, :caption, :picture)
    end
end
