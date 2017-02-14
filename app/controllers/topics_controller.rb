# frozen_string_literal: true
class TopicsController < ApplicationController
  before_action :set_category
  before_action :set_topic,
                only: [:show, :edit, :update, :destroy]

  respond_to :html, :json, :js

  def show
    if @topic
      @posts = @topic.posts.order('created_at ASC').paginate(page: params[:page], :per_page => 10)
    else
      redirect_to @category
    end
  end

  def new
    @topic = @category.topics.new
  end

  def edit
  end

  def create
    if topic_params[:name] == 'new'
      raise 'OH RIGHT.'
    end
    @topic = @category.topics.new(topic_params)
    @topic.save
    respond_with(@category, @topic)
  end

  def update
    respond_to do |format|
      if @topic.update_attributes(topic_params)
        format.html {
          @topic.update(topic_params)
          flash[:notice] = 'Topic was successfully updated.'
          respond_with(@category, @topic)
        }
        format.json {
          @topic.update(topic_params)
          respond_with @category, @topic
        }
      else
        format.json {
          respond_with @category, @topic
        }
      end
    end
  end

  def destroy
    @topic.destroy
    redirect_to @category, notice: 'Topic was successfully destroyed.'
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
