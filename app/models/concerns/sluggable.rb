module Sluggable
  extend ActiveSupport::Concern

  def set_slug
    self.slug = name.parameterize
  end

  included do
    validates :slug, uniqueness: true
    before_validation :set_slug
  end
end