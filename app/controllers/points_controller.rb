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
    @user = User.find(params["receiver_id"])
    @event.points << @point
    @point.save
    redirect_to :back
  end

  def show

  end

  def index
    @point = Point.all
  end

end
