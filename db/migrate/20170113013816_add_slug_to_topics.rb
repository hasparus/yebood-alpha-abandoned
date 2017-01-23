# frozen_string_literal: true
class AddSlugToTopics < ActiveRecord::Migration[5.0]
  def change
    add_column :topics, :slug, :string, unique: true
    add_index :topics, :slug
  end
end
