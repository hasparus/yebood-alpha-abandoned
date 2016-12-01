# frozen_string_literal: true
class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit]

  def index
    @categories = Category.all
  end

  def show
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
