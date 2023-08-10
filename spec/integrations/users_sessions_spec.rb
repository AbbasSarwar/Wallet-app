require 'rails_helper'

RSpec.describe 'User', type: :feature do
    describe 'new' do
        before(:each) do
            User.destroy_all
            @user = User.create(name:"Abbas", email:"abbas@gmail.com", password:"abbas123")
        end
        it 'Sign up page' do
            visit '/users/sign_up'
            expect(page).to have_content("Welcome to Wallet App")
            expect(page).to have_content("Name")
            expect(page).to have_content("Sign up")
        end
        it 'Sign in' do
            visit 'users/sign_in'
            expect(page).to have_content('Welcome Back')
            expect(page).to have_content('Email')
            expect(page).to have_content('Log in')
            expect(page).to have_content('Forgot your password?')
        end
    end
end