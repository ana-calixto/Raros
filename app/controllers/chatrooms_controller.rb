class ChatroomsController < ApplicationController
  def new
    @chatroom = Chatroom.new
    @chatroom = Chatroom.find(params[:id])
  end

  def index
    set_chatrooms
    @message = Message.new
  end

  def create
    @user = User.find(params[:id])
    existing_chat = find_chat
    return redirect_to chatroom_path(existing_chat) if existing_chat.present?
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

  def find_chat
    Chatroom.find_by(user_id: [@user.id, current_user.id], author: [current_user, @user])
  end

  def set_chatrooms
    @my_chatrooms = Chatroom.all.where(author: current_user)
    @chatrooms = Chatroom.all.where(user_id: current_user)
  end

end
