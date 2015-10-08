class CreatePetitionEvent
  include Change::Resources
  attr_accessor :loaded_organization
  BASE_URL = "https://www.change.org/organizations/"

  def initialize(organization)
    @client = Change::Requests::Client.new({ :api_key => ENV["CHANGE_KEY"], :secret_token => ENV["CHANGE_SECRET"] })
    @organization = Organization.new(@client)
    @loaded_organization = @organization.load(BASE_URL + "#{organization}")
    binding.pry
  end
end