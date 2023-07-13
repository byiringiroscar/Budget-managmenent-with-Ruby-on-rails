require 'rails_helper'

RSpec.describe SplashController, type: :request do
  describe '#index' do
    it 'includes "My wallet" in the view' do
      get '/'
      expect(response.body).to include('My wallet')
    end
  end
end

RSpec.feature 'Splash Page', type: :feature do
  describe 'Splash page for a new user' do
    before do
      visit unauthenticated_root_path
    end

    scenario 'User can see login button' do
      click_link 'Sign in'
      expect(current_path).to eq(new_user_session_path)
    end

    scenario 'User can see sign up button' do
      click_link 'Sign up'
      expect(current_path).to eq(new_user_registration_path)
    end
  end
end
