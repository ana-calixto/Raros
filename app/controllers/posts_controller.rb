class PostsController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.new(post_params)
    @post.user = current_user
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

  def destroy
    @post = Post.find(params[:id])
    @topic = @post.topic
    @post.destroy

    redirect_to topic_path(@topic)
  end

  def add_post_like
    @post = Post.find(params[:post_id])
    post_like = @post.post_likes.where(user_id: current_user.id).first

    if post_like.nil?
      @post.like_count +=1
      PostLike.create(post: @post, user: current_user)
    else
      @post.like_count -=1
      post_like.destroy
    end
    @post.save
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
