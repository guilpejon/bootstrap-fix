# frozen_string_literal: true

class CreateFriendRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend, null: false, foreign_key: { to_table: :users }
      t.boolean :accepted, null: false, default: false

      t.timestamps
    end
  end
end
