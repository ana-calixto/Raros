class TopicsController < ApplicationController
  def index
    @topics = Topic.all.order(created_at: :desc)
  end

  def new
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    if @topic.save
      redirect_to topics_path
    else
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to @topic, notice: 'Topic was successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path, notice: 'Topic was successfully erased!'
  end

  def add_topic_like
    @topic = Topic.find(params[:topic_id])

    topic_like = @topic.topic_likes.where(user_id: current_user.id).first
    if topic_like.nil?
      @topic.like_count +=1
      TopicLike.create(topic: @topic, user: current_user)
    else
      @topic.like_count -=1
      topic_like.destroy
    end
    @topic.save
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :content)
  end
end
