# frozen_string_literal: true
class Category < ApplicationRecord
  has_many :topics, dependent: :destroy
end
