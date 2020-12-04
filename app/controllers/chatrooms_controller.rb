class ChatroomsController < ApplicationController
  def new
    @chatroom = Chatroom.new
    @chatroom = Chatroom.find(params[:id])
  end

  def index
    
  end

  def create
    @user = User.find(params[:id])
    @chatroom = Chatroom.new(user_id: @user.id, author: current_user)
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      flash[:notice] = 'Não foi possível abrir o chat agora, tente de novo mais tarde.'
      redirect_to root_path
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
