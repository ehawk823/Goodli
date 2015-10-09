require 'spec_helper'
include Warden::Test::Helpers

feature 'Visitor creates an event' do
  scenario 'with valid title, location and description' do
    let(:authed_user) { create_logged_in_user }
    visit event_path(authed_user)
    create_event_with 'Went to the Park', 'The Park', 'Went to the park to clean up the grass.'

    expect(page).to have_content('Park')
  end

  scenario 'with invalid title' do
    let(:authed_user) { create_logged_in_user }
    visit event_path(authed_user)
    create_event_with 'This title is just way way way too long', 'The Park', 'Went to the park to clean up the grass.'

    expect(page).to have_no_content('Park')
  end

  scenario 'with invalid location' do
    let(:authed_user) { create_logged_in_user }
    visit event_path(authed_user)
    create_event_with 'Went to the Park', 'This location is just way way way too long', 'Went to the park to clean up the grass.'

    expect(page).to have_no_content('Park')
  end

  scenario 'with invalid description' do
    let(:authed_user) { create_logged_in_user }
    visit event_path(authed_user)
    create_event_with 'Went to the Park', 'The Park', 'Description too short'

    expect(page).to have_no_content('Park')
  end

  # "supporting methods"

  def create_event_with(title, location, description)
   visit events_path
   fill_in 'Event title', with: title
   fill_in 'Location', with: location
   fill_in 'Description', with: description
   click_button 'Submit'
  end

  def create_logged_in_user
    user = Factory(:user)
    login(user)
    user
  end

  def login(user)
    login_as user, scope: :user
  end

end
