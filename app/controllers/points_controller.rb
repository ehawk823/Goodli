class PointsController < ApplicationController
  def new
    @point = Point.new
  end

  def create
    @point = Point.new
    @point.value = 1
    @point.receiver = User.find(params["receiver_id"])
    @event = Event.find(params["events"]["id"])
    @point.sender = User.find(params["sender_id"])
    @point.sender.giveable_karma -= 1
    @point.sender.save
    @user = User.find(params["receiver_id"])
    @user.giveable_karma += 2
    @user.save
    @event.points << @point
    @point.save
    @points_received = Point.where(receiver_id: params["receiver_id"])
  end

  def show

  end

  def index
    @point = Point.all
  end

end
