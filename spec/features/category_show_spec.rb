require 'rails_helper'

RSpec.describe 'Check for Category info', type: :feature do
include Devise::Test::IntegrationHelpers

  before do
    user = FactoryBot.create(:user)
    sign_in(user)
    visit category_path(FactoryBot.create(:category))
  end

  it 'should show the correct subheader' do
    expect(page).to have_content('Most recent')
  end

    scenario 'Should show the Total spend' do
        expect(page).to have_content('Total spend')
    end
end