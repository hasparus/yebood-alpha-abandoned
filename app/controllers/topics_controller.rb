# frozen_string_literal: true
class TopicsController < ApplicationController
  before_action :set_category
  before_action :set_topic,
                only: [:show, :edit, :update, :destroy]

  respond_to :html, :json, :js

  # def index
  #   @topics = Topic.all
  # end

  def show
  end

  def new
    @topic = Topic.new
  end

  def edit
  end

  def create
    @topic = @category.topics.new(topic_params)
    @topic.save
    respond_with(@category, @topic)
  end

  def update
    @topic.update(topic_params)
    flash[:notice] = 'Topic was successfully updated.'
    respond_with(@category, @topic)
  end

  def destroy
    @topic.destroy
    redirect_to topics_url, notice: 'Topic was successfully destroyed.'
  end

  private

  def set_category
    @category = Category.find_by category_slug: params[:category_category_slug]
  end

  def set_topic
    @topic = Topic.find_by topic_slug: params[:topic_slug]
  end

  def topic_params
    params.require(:topic).permit(:name)
  end
end
