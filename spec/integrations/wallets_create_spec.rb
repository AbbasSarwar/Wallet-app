require 'rails_helper'

RSpec.describe 'Wallet', type: :feature do
  describe 'Create new group' do
    before(:each) do
      User.destroy_all
      Group.destroy_all
      @user = User.create(name: 'Abbas', email: 'abbas@gmail.com', password: 'abbas123')
      @group = Group.create(name: 'Amazon', icon: Rack::Test::UploadedFile.new('spec/assets/daraz.jpg'))
      visit new_user_session_path
      fill_in 'Email', with: 'abbas@gmail.com'
      fill_in 'Password', with: 'abbas123'
      click_button 'Log in'
      click_link 'Add New'
      fill_in 'Name', with: 'Amazon'
      attach_file('Icon', "#{Rails.root}spec/assets/daraz.jpg")
      click_button 'Submit'
      visit root_path
      click_link 'Amazon'
      click_link 'Add New'
      fill_in 'Name', with: 'Item1'
      fill_in 'Amount', with: 200
      click_button 'Submit'
      expect(page).to have_content('Amazon')
    end
    it 'Create new Wallet' do
      visit root_path
      click_link 'Amazon'
      click_link 'Item1'
      expect(page).to have_content('200')
      expect(page).to have_content('Amazon')
      expect(page).to have_content('Item1')
      expect(page).to have_content('Go back')
    end
  end
end
