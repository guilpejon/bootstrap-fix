# frozen_string_literal: true

class FriendRequestsController < ApplicationController
  before_action :validate_friend_request, only: [:create]

  def index
    @friend_requests = current_user.friend_requests
  end

  def create
    flash["request-#{friend_id}"] = if @friend_request.save
                                      'Friend request sent'
                                    else
                                      'Friend request can not be sent'
                                    end

    redirect_to users_path
  end

  def update
    friend_request = FriendRequest.find(params[:id])
    friend_request.update(accepted: true)
    redirect_to friend_requests_path
  end

  private

  def validate_friend_request
    @friend_request = FriendRequest.find_or_initialize_by(friend_id:, user_id: current_user.id)
    return unless @friend_request.id.present?

    flash['already-sent-alert'] = 'You already sent a friend request to this user'
    redirect_to users_path
  end

  def friend_id
    @friend_id ||= params[:friend_id]
  end
end
