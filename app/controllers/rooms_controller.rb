class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @room = Room.new
    @rooms = Room.public_rooms
    @users = User.all_except(current_user)
  end
  
  def show
    @show_room = Room.find_by(id: params[:id])

    @room = Room.new
    @rooms = Room.public_rooms

    @message = Message.new
    @messages = @show_room.messages.order(created_at: :asc)

    @user = current_user
    @users = User.all_except(current_user)
    render 'index'
  end
  def create
    @room = Room.create!(name: params[:room][:name])
  end
end
