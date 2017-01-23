# frozen_string_literal: true
class ChangeSlugColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :topics, :slug, :topic_slug
    rename_column :categories, :slug, :category_slug
  end
end
