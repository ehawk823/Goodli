require './app/helpers/organizations_helper'

class CreateOrganization
  include OrganizationsHelper
  include Change::Resources
  attr_accessor :client, :organization, :loaded_organization, :name, :website, :change_org_url

  def initialize
    @client = Change::Requests::Client.new({ :api_key => ENV["CHANGE_KEY"], :secret_token => ENV["CHANGE_SECRET"] })
    @organization = Organization.new(@client)
    binding.pry
    @loaded_organization = @organization.load(pick_organization)
    @name = @loaded_organization['name']
    @website = @loaded_organization['website'] 
    @change_org_url = @loaded_organization['organization_url']
  end

  private

  def pick_organization
    return_organizations_array.sample
  end
end

CreateOrganization.new(client, return_organizations_array).call