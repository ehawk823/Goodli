class UsersController < ApplicationController
  def show
    @id = params[:id]
    @user = User.find_by_id(@id)
    @points_received = Point.where(receiver_id: @id)
  end

  def index
    @users = User.all
  end

  def update
    if params[:user][:name] == nil
      @name = current_user.name
    else
      current_user.name = params[:user][:name]
      @name = current_user.name
      current_user.save
    end
    if params[:user][:location] == nil
      @location = current_user.location
    else
      current_user.location = params[:user][:location]
      @location = current_user.location
      current_user.save
    end
    if params[:user][:bio] == nil
      @mission = current_user.bio
    else
      current_user.bio = params[:user][:bio]
      @mission = current_user.bio
      current_user.save
    end
  end
end
