class PostsController < ApplicationController
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post.topic
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
