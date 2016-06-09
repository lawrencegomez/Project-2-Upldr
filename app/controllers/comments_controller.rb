class CommentsController < ApplicationController

  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(comments_params)
    @comment.user = current_user
    if @comment.save
      redirect_to comments_path
    else
      redirect_to new_comment_path
    end
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def show
  end

  def update
    if @comment.update(comments_params)
      redirect_to comments_path
    else
      redirect_to edit_comment_path(@comment)
    end
  end

  def destroy
    @comment.destroy
      redirect_to comments_path
  end

private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:body)
  end

end
