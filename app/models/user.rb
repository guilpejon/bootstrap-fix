# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friend_requests, ->(user) { where(friend_id: user.id, accepted: false) }, foreign_key: :friend_id
  has_many :posts

  def friends
    friend_requests = FriendRequest.where(accepted: true).where('user_id = ? or friend_id = ?', id, id)
    friend_requests.map { |request| request.friend.id == id ? request.user : request.friend }
  end
end
