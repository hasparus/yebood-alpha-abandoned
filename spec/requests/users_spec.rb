require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/1' do
    before(:each) do
      @user = create(:user)
    end

    it 'should redirect user edit path for unlogged user' do
      get edit_user_registration_path
      expect(response).to have_http_status(302)
      expect(response.body).to include('/users/sign_in')
    end

    it 'should allow user edit his registration' do
      sign_in @user
      get edit_user_registration_path
      expect(response).to have_http_status(200)

    end
  end
end