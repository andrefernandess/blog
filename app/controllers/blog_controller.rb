class BlogController < ApplicationController
  def index
    @posts = Post.where("publish_date <= ?", Time.zone.now).first
  end
end
