# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /categories' do
    before(:each) do
      create(:category)
    end

    it 'should show all categories' do
      get categories_path
      expect(response).to have_http_status(200)
      expect(response.body).to include('Podatki w Biznesie')
    end
  end
end
