class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.all_except(current_user)

    @room = Room.new
    @rooms = Room.public_rooms
    @room_name = get_name(@user, current_user)
    @show_room = Room.where(name: @room_name).first || Room.create_private_room([@user, current_user], @room_name)

    @message = Message.new
    @messages = @show_room.messages.order(created_at: :asc)
    render 'rooms/index'
  end

  private
  def get_name(user1, user2)
    user = [user1, user2].sort
    "Chat room #{user[0].name} and #{user[1].name}"
  end
end
