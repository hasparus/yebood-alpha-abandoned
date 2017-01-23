# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @post = build :post
  end

  it 'should have valid factory' do
    expect(@post).to be_valid
  end

  it 'should have topic' do
    @post.topic = nil
    expect(@post).not_to be_valid
  end

  it 'should have content' do
    @post.content = ' '
    expect(@post).not_to be_valid
  end

  it 'should have poster' do
    @post.user = nil
    expect(@post).not_to be_valid
  end
end
