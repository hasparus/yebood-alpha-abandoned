# frozen_string_literal: true
class Post < ApplicationRecord
  belongs_to :topic, touch: true
  belongs_to :user
  validates :user, presence: true
  validates :topic, presence: true
  validates :content, presence: true
end
