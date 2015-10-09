require 'spec_helper'
describe 'user can create an event', :type => :model do
  it 'will be persisted with a valid title, location and description' do
    event = Event.create(title: "Go to the Park", location: "the park", description: "I went to the park with my friends.")
    expect(event).to be_persisted
  end

  it 'will not be persisted with an invalid title' do
    event = Event.create(title: "This title is going to be way way way too long", location: "the park", description: "I went to the park with my friends.")
    expect(Event.find_by(title: "This title is going to be way way way too long")).to eq(nil)
  end

  it 'will not be persisted with an invalid location' do
    event = Event.create(title: "Go to the park", location: "This location is going to be way way way too long", description: "I went to the park with my friends.")
    expect(Event.find_by(title: "Go to the park")).to eq(nil)
  end

  it 'will not be persisted with an invalid description' do
    event = Event.create(title: "Go to the park", location: "the park", description: "b")
    expect(Event.find_by(title: "Go to the park")).to eq(nil)
  end

end
