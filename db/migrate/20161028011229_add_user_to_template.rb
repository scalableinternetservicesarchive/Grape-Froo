class AddUserToTemplate < ActiveRecord::Migration[5.0]
  def change
    add_reference :templates, :user, foreign_key: true
  end
end
