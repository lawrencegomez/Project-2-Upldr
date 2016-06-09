class CommentsController < ApplicationController

  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  def index
    @comments = Comment.all
  end

  def create
    @image = Image.find_by_id(params[:comment][:image])
    @comment = Comment.new(comments_params)
    @comment.image = @image
    @comment.user = current_user
    # logger.debug(@image)
    if @comment.save
      redirect_to image_path(@image)
    else
      redirect_to new_image_comment_path(@image)
    end
  end

  def new
    @image = Image.find(params[:image_id])
    @comment = @image.comments.build
  end

  def edit
    @comment = Comment.find(params[:id])
    @image = @comment.image
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def update
    @image = Image.find_by_id(params[:comment][:image])
    @comment = Comment.find(params[:id])
    if @comment.update(comments_params)
      redirect_to image_comment_path(@image, @comment)
    else
      redirect_to edit_image_comment_path(@image, @comment)
    end
  end

  def destroy
    @image = Image.find_by_id(params[:image])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to images_path(@image)
    else
      redirect_to image_path(@images)
    end
  end

private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:body)
  end

end
