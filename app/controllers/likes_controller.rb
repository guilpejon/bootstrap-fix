# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    create_like
    if params[:action_view] == 'show'
      redirect_to post_path(params[:post_id])
    else
      redirect_to posts_path
    end
  end

  private

  def create_like
    post = Post.find(params[:post_id])
    post.likes.create!(user_id: current_user.id)
  end
end
