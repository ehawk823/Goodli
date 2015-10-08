require "spec_helper"
require "rails_helper"

describe CreateOrganizationPetition do 
  describe "initialize" do
    it "should be a petition from the change api" do
      service_object = CreateOrganizationPetition.new("george-toothman-bike-lanes")
      expect(service_object.loaded_organization).to be_a Hash
    end
  end
end