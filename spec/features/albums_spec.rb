require 'spec_helper'
include Warden::Test::Helpers

feature 'Album management' do

  before(:each) do
    create(:user)
    visit new_user_session_path
    fill_in 'Login', with: 'user'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'
  end
  
  scenario 'create a new album', js: true do
    visit new_album_path
    expect {
      fill_in 'Title', with: 'Born under a bad sign'
      fill_in 'Author', with: 'Albert King'
      find('label', :text => 'Date').click
      click_button 'Today'
      click_button 'Save'
    }.to change(Album, :count).by(1)
  end
end