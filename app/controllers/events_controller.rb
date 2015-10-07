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
    @organization = CreateOrganization.new
    @event.title = params["title"]
    @event.description = params["description"]
    @event.users << current_user
    @event.save
    redirect_to root_url
  end
end
