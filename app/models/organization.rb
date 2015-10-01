class Organization
  include OrganizationsHelper
  include Change::Resources
  attr_accessor :client, :organization, :loaded_organization, :name, :website, :change_org_url

  def initialize
    @client = Change::Requests::Client.new({ :api_key => ENV["CHANGE_KEY"], :secret_token => ENV["CHANGE_SECRET"] })
    @organization = Organization.new(@client)
    @loaded_organization = @organization.load(pick_organization)
    @name = @loaded_petition['name']
    @website = @loaded_petition['website'] 
    @change_org_url = @loaded_petition['organization_url']
  end

  def pick_organization
    @organization_url = return_organizations_array.sample
  end
end