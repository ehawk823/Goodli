require "spec_helper"

describe Petition do
  describe "initialize" do
    it "returns a has from the change.org api" do
      @petition = Petition.new
      expect(@petition).to be_a(Hash)
    end
  end
end  