# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'Basic Forum Features', type: :feature do
  include Warden::Test::Helpers

  before do
    @category = create :category
  end

  after do
    Warden.test_reset!
  end

  scenario 'User creates a new topic' do
    visit '/podatki-w-biznesie'

    expect(page).to have_http_status(:ok)
    #todo TO MA SLUGA, A NIE DZIALA POWYZSZA LINIJKA


    click_link 'New topic'

    fill_in 'topic_name', with: 'My Topic'
    click_button 'Create Topic'

    #expect(page).to have_text('Widget was successfully created.')
    expect(page).to have_http_status(:ok)
  end
end
