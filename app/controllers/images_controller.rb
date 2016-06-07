class ImagesController < ApplicationController

  before_action :authorize

  def index
    @images = Image.all
  end

  def create
    @image = Image.new(images_params)
    @image.user = current_user
    if @image.save
      redirect_to image_path(@image)
    else
      redirect_to new_image_path
    end
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def show
    @image = Image.find(params[:id])
  end

  def update
  end

  def destroy
  end

private
  def images_params
    params.require(:image).permit(:title, :image_url, :description, :tags)
  end

end
