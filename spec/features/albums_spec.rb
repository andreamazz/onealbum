require 'spec_helper'
include Warden::Test::Helpers

feature 'Album management' do

  before(:each) do
    @user = create(:user)
  end
  
  def sign_in user
    visit new_user_session_path
    fill_in 'Login', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end
  
  def create_album
    visit new_album_path
    fill_in 'Title', with: 'Born under a bad sign'
    fill_in 'Author', with: 'Albert King'
    find('label', :text => 'Date').click
    click_button 'Today'
    click_button 'Save'
  end
  
  scenario 'create a new album', js: true do
    sign_in @user
    expect {
      create_album
    }.to change(Album, :count).by(1)
  end
  
  scenario 'creating a new album redirects to the album list', js: true do
    sign_in @user
    create_album
    expect(current_path).to eq albums_path
  end
  
  scenario 'clicking on a calendar cell when logged in opens album#show', js: true do
    sign_in @user
    create_album
    visit albums_path
    find("#date_#{Date.today.day}").click
    expect(current_path).to eq album_path(Album.last)
  end
  
end