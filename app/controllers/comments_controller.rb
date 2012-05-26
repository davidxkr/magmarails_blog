class CommentsController < ApplicationController
  before_filter :find_post, :only => :create
  def create
    @comment = @post.comments.build(params[:comment])
    @comment.save
    redirect_to @post
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy 
    redirect_to @comment.post
  end
  
  private
  def find_post
    @post = Post.find(params[:post_id])
  end
end

