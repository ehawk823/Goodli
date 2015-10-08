require "spec_helper"
require "rails_helper"

describe CreatePetitionEvent do 
  describe "initialize" do
    it "should be an event from the change api" do
      service_object = CreatePetitionEvent.new("duoduo_animal_welfare_project")
      expect(service_object.loaded_organization).to be_a Hash
    end
  end
end