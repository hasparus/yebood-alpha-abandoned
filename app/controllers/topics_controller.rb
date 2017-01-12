 
 
class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json, :js

  def index
    @topics = Topic.all
  end 

  def show
  end 

  def new 
    @topic = Topic.new
  end 

  def edit
  end 

  def create
    @topic = Topic.new(topic_params)
    @topic.save
    respond_with(@topic)
  end 

  def update
    @topic.update(topic_params)
    flash[:notice] = 'Topic was successfully updated.'
    respond_with(@topic)
  end 

  def destroy
    @topic.destroy
    redirect_to topics_url, notice: 'Topic was successfully destroyed.'
  end 

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end 

    def topic_params
      params.require(:topic).permit(:name) 
    end 
end
 
