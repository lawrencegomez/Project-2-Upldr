class CommentsController < ApplicationController

  before_action :authorize

  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(comments_params)
    @comment.user = current_user
    if @comment.save
      redirect_to comment_path(@comment)
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
    @comment = Comment.find(params[:id])
  end

  def update
  end

  def destroy
  end

private
  def comments_params
    params.require(:comment).permit(:body)
  end

end
