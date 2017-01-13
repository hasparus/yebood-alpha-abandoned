# frozen_string_literal: true
class Category < ApplicationRecord
  #include Sluggable
  validates :category_slug, uniqueness: true
  before_validation :set_slug

  has_many :topics, dependent: :destroy

  def to_param
    category_slug
  end

  private
    def set_slug
      self.category_slug = name.parameterize
    end
end
