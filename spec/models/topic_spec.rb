require 'rails_helper'

RSpec.describe Topic, type: :model do

  before(:each) do
    @topic = build :topic
  end

  it 'should have valid factory' do
    expect(@topic).to be_valid
  end

  it 'should have category' do
    @topic.category = nil
    expect(@topic).not_to be_valid
  end

  it 'should have name' do
    @topic.name = ' '
    expect(@topic).not_to be_valid
  end

  it 'should have slug' do
    @topic.slug = ' '
    expect(@topic).not_to be_valid
  end

end
