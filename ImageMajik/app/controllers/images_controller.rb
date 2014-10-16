class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def index
    @images = Image.all
  end

  def show
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def create
    @image = Image.new(image_params)
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
      redirect_to @image, notice: "Successfully Deleted"
    end
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:label, :caption)
    end
end
