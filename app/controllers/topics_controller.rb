require 'pry-byebug'
class TopicsController < ApplicationController
  before_action :set_counter, only: [:show]
  before_action :set_topics, only: [:show, :edit, :update, :destroy, :add_topic_like]
  skip_before_action :verify_authenticity_token, :only => [:add_topic_like]


  def index
  end

  def new
    @topic = Topic.new
  end

  def show
    @topic_like = !@topic.topic_likes.where(user_id: current_user.id).first.nil?
    respond_to do |format|
        format.html
        format.json { render json: { counter: @topic_likes_counter, liked: @topic_like } }
      end
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    if @topic.save
      redirect_to pages_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to @topic, notice: 'Topic was successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path, notice: 'Topic was successfully erased!'
  end

  def add_topic_like
    topic_like = @topic.topic_likes.where(user_id: current_user.id).first
    if topic_like.nil?
      @topic.like_count +=1
      TopicLike.create(topic: @topic, user: current_user)
    else
      @topic.like_count -=1
      topic_like.destroy
    end
    @topic.save
    respond_to do |format|
          format.html
          format.json { render json: { counter: @topic.like_count, liked: !topic_like.nil? } }
        end
  end

  def search
    if params[:query].present?
      @results = PgSearch.multisearch(params[:query])
    else
      @results = Topic.all
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :content)
  end

  def set_topics
    @topic = Topic.find(params[:id])
  end

  def set_counter
    set_topics
    @topic_likes_counter = @topic.like_count
  end
end
