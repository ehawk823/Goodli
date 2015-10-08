class CreateOrganizationPetition
  include Change::Resources
  attr_accessor :loaded_petition
  BASE_URL = "https://www.change.org/p/"
 
  def initialize(petition)
    @client = Change::Requests::Client.new({ :api_key => ENV["CHANGE_KEY"], :secret_token => ENV["CHANGE_SECRET"] })
    @petition = Petition.new(@client)
    binding.pry
    @loaded_petition = @petition.load(BASE_URL + "#{petition}")
    @title = @loaded_petition['title']
    @creator_name = @loaded_petition['targets'][0]['name']
  end
end