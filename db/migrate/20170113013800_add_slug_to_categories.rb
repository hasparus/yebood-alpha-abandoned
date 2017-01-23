# frozen_string_literal: true
class AddSlugToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :slug, :string, unique: true
    add_index :categories, :slug
  end
end
