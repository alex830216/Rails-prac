class AddUserToNote < ActiveRecord::Migration[6.1]
  def change
    # notes -> user_id
    add_reference :notes, :user, foreign_key: true
  end
end
