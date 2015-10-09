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
  end

  def get_petitions
    sample_petition = @organization.petitions.load
    sample_title = sample_petition[0]["title"]
    sample_url = sample_petition[0]["url"]
    new_event = Event.new
    new_event.host_id = "1"
    new_event.title = sample_title
    new_event.description = sample_url
    new_event.from_change = true
    new_event.save
  end
end