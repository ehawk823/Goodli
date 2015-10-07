class CreateOrganization
  include Change::Resources
  attr_accessor :client, :organization, :loaded_organization, :name, :website, :change_org_url

  def initialize
    @client = Change::Requests::Client.new({ :api_key => ENV["CHANGE_KEY"], :secret_token => ENV["CHANGE_SECRET"] })
    @organization = Organization.new(@client)
    @loaded_organization = @organization.load.pick_organization(url_array)
    @name = @loaded_organization['name']
    @website = @loaded_organization['website'] 
    @change_org_url = @loaded_organization['organization_url']
  end

  private

  url_array = ["https://www.change.org/organizations/goodli", "https://www.change.org/organizations/duoduo_animal_welfare_project","https://www.change.org/organizations/population_connection_action_fund", "https://www.change.org/u/356393312", "https://www.change.org/organizations/mercy_for_animals"]

  def pick_organization(url_array)
    url_array.sample
  end
end

test = CreateOrganization.new
