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
  
  describe 'creating a new album', slow: true do
    scenario 'creates a new album in the database', js: true do
      sign_in @user
      expect {
        create_album
      }.to change(Album, :count).by(1)
    end
  
    scenario 'redirects to the album list', js: true do
      sign_in @user
      create_album
      expect(current_path).to eq albums_path
    end
  end
  
  scenario 'clicking on a calendar cell when logged in opens album#show', js: true, slow: true do
    sign_in @user
    create_album
    visit albums_path
    find_link("#{Date.today.day}").click
    expect(current_path).to eq album_path(Album.last)
  end
  
  describe 'in the album index' do
    before :each do
      visit albums_path
    end
    
    scenario 'when logged in the new album button is visible' do
      sign_in @user
      visit albums_path
      expect(page).to have_content("New")
    end
    
    scenario 'when not logged in the new album button is visible' do
      visit albums_path
      expect(page).to_not have_content("New")
    end
    
    scenario 'the current month is shown' do
      expect(page).to have_content(I18n.t("date.month_names")[Date.today.month])
    end
  
    scenario 'clicking the left arrow goes to the previous month', js: true do
      find('.icon-chevron-left').click
      expect(page).to have_content(I18n.t("date.month_names")[Date.today.month - 1])
    end
  
    scenario 'clicking the right arrow goes to the next month', js: true do
      find('.icon-chevron-right').click
      expect(page).to have_content(I18n.t("date.month_names")[Date.today.month + 1])
    end
  end
  
end