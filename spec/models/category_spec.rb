# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @category = build :category
  end

  it 'should have valid factory' do
    expect(@category).to be_valid
  end

  it 'should have name' do
    @category.name = ' '
    expect(@category).not_to be_valid
  end

  it 'should receive slug before validation' do
    @category.category_slug = ' '
    expect(@category).to be_valid
  end
end
