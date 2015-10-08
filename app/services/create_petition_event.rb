class CreatePetitionEvent
  include Change::Resources
  BASE_URL = "https://www.change.org/organizations/"
  # ORG_URL = "https://api.change.org/v1/organizations"
  ORGS = ["duoduo_animal_welfare_project", "goodli", "glaad", "population_connection_action_fund", "lcv"]
  
  def initialize
    organization = ORGS.sample
    #sets and loads the org so that we can get it's petitions
    @client = Change::Requests::Client.new({ :api_key => ENV["CHANGE_KEY"], :secret_token => ENV["CHANGE_SECRET"] })
    @organization = Organization.new(@client)
    org_id = @organization.get_id(BASE_URL + "#{organization}")
    loaded_org = @organization.load(org_id)
    binding.pry
  end

  def get_petitions
    sample_petition = @organization.petitions.load
    # look at the result object. Is it an array of petitions? What data comes w/ each petition? What data will we take to make 
    #   new Event objects
    sample_title = sample_petition[0]["title"]
    sample_url = sample_petition[0]["url"]
    new_event = Event.new
    new_event.title = sample_title
    new_event.save
    new_event.description = sample_url
    new_event.description.save
    binding.pry
  end

  def make_events_from_petitions
    # get_petitions.each do |make the eventslasdjfaw|
      # the result of this method is several newly created and saved events
  end
end