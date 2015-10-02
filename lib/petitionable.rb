module Petitionable
  include ActionView::Helpers
  include Change::Resources
  attr_accessor :client, :petition, :loaded_petition, :title, :creator_name

  def initialize
    @client = Change::Requests::Client.new({ :api_key => ENV["CHANGE_KEY"], :secret_token => ENV["CHANGE_SECRET"] })
    @petition = Petition.new(@client)
    binding.pry
    @loaded_petition = @petition.load(random_petition_url)
    @title = @loaded_petition['title']
    @creator_name = @loaded_petition['targets'][0]['name']
  end

  def random_petition_url
    @random_url = return_petitions_array.sample
  end
end

