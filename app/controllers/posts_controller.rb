# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = current_user.friends.map(&:posts).flatten
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge!(user_id: current_user.id))
    if @post.save
      redirect_to posts_path
    else
      redirect_to new_post_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:description)
  end
end
