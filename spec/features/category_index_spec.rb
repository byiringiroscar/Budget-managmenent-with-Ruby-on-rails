require 'rails_helper'

RSpec.feature 'Check for Categories', type: :feature do
  include Devise::Test::IntegrationHelpers

  background do
    user = FactoryBot.create(:user)
    sign_in(user) # Log in the user using Devise test helper
    visit authenticated_root_path # Visit the authenticated root path
  end

  scenario 'Should show the correct title' do
    expect(page).to have_content('Categories')
  end

    scenario 'Should show the correct header' do
        expect(page).to have_content('Categories')
    end

    scenario 'Should show the correct subheader' do
        expect(page).to have_content('Most recent')
    end

    scenario 'Should show the Total spend' do
        expect(page).to have_content('Total spend')
    end

    scenario 'Should show New category link_to ' do
        expect(page).to have_link('New category')
    end
end
