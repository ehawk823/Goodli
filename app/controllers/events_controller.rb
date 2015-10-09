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
    @event.date = params[:event]["date(3i)"] + "/" + params[:event]["date(2i)"] + "/" + params[:event]["date(1i)"] + "at" + params[:event]["date(4i)"] + ":" + params[:event]["date(5i)"]
    @event.title = params["title"]
    @event.location = params["location"]
    @event.description = params["description"]
    @event.host = User.find(params["host_id"])
    @event.users << current_user
    @event.save
    redirect_to root_url
  end

  def get_petitions
    test = CreatePetitionEvent.new
    petition_array = test.get_petitions
    redirect_to events_list_path
  end

  def rsvp
    @event = Event.find(params["event_id"])
    @event.users << current_user
    @event.save
    current_user.save
    redirect_to root_url
  end

  def destroy
    @event = Event.find(params["event_id"])
    @event.destroy
    redirect_to root_url
  end
end
