class EventsController < ApplicationController
  def index
    @events = Event.all
    @points = Point.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    @event.date = params[:event]["date(3i)"] + "/" + params[:event]["date(2i)"] + "/" + params[:event]["date(1i)"] + "at" + params[:event]["date(4i)"] + ":" + params[:event]["date(5i)"]
    @event.title = params["title"]
    @event.location = params["location"]
    @event.description = params["description"]
    @event.host = User.find(params["host_id"])
    @event.users << current_user
    @event.save
    redirect_to root_url
  end

  def rsvp
    @event.users << current_user
    @event.save
    redirect_to root_url
  end

end
