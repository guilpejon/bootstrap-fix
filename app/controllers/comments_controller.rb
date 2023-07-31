# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    create_comment
    if params[:action_view] == 'show'
      redirect_to post_path(params[:post_id])
    else
      redirect_to posts_path
    end
  end

  private

  def create_comment
    post = Post.find(params[:post_id])
    post.comments.create!(comment_params)
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end
