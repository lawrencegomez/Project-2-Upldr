class ImagesController < ApplicationController

  before_action :set_image, only: [:edit, :show, :update, :destroy, :upvote]
  before_action :authorize

  def index
    @images = Image.all.order("created_at DESC")
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
  end

  def update
    if @image.update_attributes(images_params)
      redirect_to images_path
    else
      redirect_to edit_image_path(@image)
    end
  end

  def destroy
      @image.destroy
        redirect_to images_path
  end

  def upvote
    @image.upvote_by current_user
      redirect_to :back
  end



private

  def set_image
    if Image.count > 0
    @image = Image.find(params[:id])
    end
  end

  def images_params
    params.require(:image).permit(:title, :img, :description, :tags, :image_remote_url)
  end

end
