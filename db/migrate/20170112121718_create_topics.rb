# frozen_string_literal: true
class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :name
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
