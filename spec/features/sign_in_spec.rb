require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe 'the signin process', type: :feature do
  context 'when successful' do
    before :each do
      FactoryBot.create(:user, email: 'user@example.com', password: 'admin123')
    end

    it 'Log in => Signed in successfully.' do
      visit new_user_session_path
      within('form#new_user') do
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'admin123'
      end
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
      expect(page).to have_content 'Categories'
    end
  end
end
