class AddUsersToReplies < ActiveRecord::Migration[5.1]
  def change
    add_reference :replies, :user, foreign_key: true
  end
end
