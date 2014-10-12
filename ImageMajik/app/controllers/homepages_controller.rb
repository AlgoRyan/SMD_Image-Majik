class HomepagesController < ApplicationController
  before_action :set_homepage, only: [:show, :edit, :update, :destroy]

  def index
    @homepages = Homepage.all
    
  end

  def show
 
  end

  def new
    @homepage = Homepage.new
    
  end

  def edit
  end

  def create
    @homepage = Homepage.new(homepage_params)
    @homepage.save
   
  end

  def update
    @homepage.update(homepage_params)
   
  end

  def destroy
    @homepage.destroy
    
  end

  private
    def set_homepage
      @homepage = Homepage.find(params[:id])
    end

    def homepage_params
      params[:homepage]
    end
end
