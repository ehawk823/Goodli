require "spec_helper"

describe Organization do
  describe "initialize" do
    it "returns a has from the change.org api" do
      @organization = Organization.new
      expect(@organization).to be_a(Hash)
    end
  end
end  