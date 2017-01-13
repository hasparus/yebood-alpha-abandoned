class Topic < ApplicationRecord
  # include Sluggable

  belongs_to :category
  has_many :posts
  default_scope -> { order(id: :desc) }
  validates :category, presence: true
 # validates :name, presence: true
 # validates :name, uniqueness: { case_sensitive: false }
  validates :topic_slug, presence: true
  validates :topic_slug, uniqueness: { scope: :category_id }
  before_validation :set_slug

  def set_slug
    self.topic_slug = name.parameterize
  end

  def to_param
    topic_slug
  end
end