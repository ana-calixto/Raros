class PostsController < ApplicationController
  def edit
    @post = Post.find(params[:id])
    @post = Post.update(post_params)
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.new(post_params)
    @post.topic = @topic

    if @post.save
      redirect_to topic_path(@topic)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
