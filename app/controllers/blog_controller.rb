class BlogController < ApplicationController
  layout "application_blank"
  def index
    @posts = Post.where("publish_date <= ?", Time.zone.now).order("publish_date desc").first
  end
end
