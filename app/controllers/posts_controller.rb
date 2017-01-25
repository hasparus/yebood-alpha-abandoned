# frozen_string_literal: true
class PostsController < ApplicationController
  before_action :set_category
  before_action :set_topic
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json, :js

  def new
    @post = @topic.posts.new user: current_user
  end

  def edit
  end

  def create
    @post = @topic.posts.new(post_params)
    @post.save
    respond_with(@post)
  end

  def update
    @post.update(post_params)
    flash[:notice] = 'Post was successfully updated.'
    respond_with(@post)
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_category
    @category = Category.find_by category_slug: params[:category_category_slug]
  end

  def set_topic
    @topic = Topic.find_by topic_slug: params[:topic_topic_slug]
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
