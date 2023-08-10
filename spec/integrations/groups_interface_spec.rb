require 'rails_helper'

RSpec.describe 'Group', type: :feature do
  describe 'new' do
    before(:each) do
      User.destroy_all
      Group.destroy_all
      @user = User.create(name: 'Abbas', email: 'abbas@gmail.com', password: 'abbas123')
      @group = Group.create(name: 'Amazon', icon: Rack::Test::UploadedFile.new('spec/assets/daraz.jpg'))
      visit new_user_session_path
      fill_in 'Email', with: 'abbas@gmail.com'
      fill_in 'Password', with: 'abbas123'
      click_button 'Log in'
    end
    it 'should have data' do
      expect(page).to have_content('Your Catogeries')
      expect(page).to have_content('Home')
    end
    it 'Group should Add New' do
      click_link 'Add New'
      expect(page).to have_content('Name')
      expect(page).to have_content('Add new Catogery')
      fill_in 'Name', with: 'Amazon'
      attach_file('Icon', "#{Rails.root}spec/assets/daraz.jpg")
      click_button 'Submit'
      visit root_path
      expect(page).to have_content('Amazon')
      expect(page).to have_content(0)
    end
  end
end
