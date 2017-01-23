# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @krystian = build :user
  end

  it 'has a valid factory' do
    expect(@krystian.name).equal? 'Krystian'
    # TODO: more
  end

  it 'should not create user without email' do
    cnt = User.count
    @krystian.email = ''
    @krystian.save
    expect(User.count).equal? cnt
  end

  it 'test user#name' do
    @krystian.name = ''
    @krystian.save!
  end
end
