class AddUserToComment < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :user, null: false, default: 0, foreign_key: true
  end
end
