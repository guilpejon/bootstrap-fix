# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    user_friends = current_user.friends.pluck(:id)
    user_friends << current_user.id
    @users = User.where.not(id: user_friends)
  end
end
