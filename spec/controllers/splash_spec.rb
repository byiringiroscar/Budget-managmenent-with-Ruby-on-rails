require 'rails_helper'

RSpec.describe SplashController, type: :request do
  describe "#index" do
    it 'includes "My wallet" in the view' do
        get '/'
        expect(response.body).to include('My wallet')
    end
  end
end
