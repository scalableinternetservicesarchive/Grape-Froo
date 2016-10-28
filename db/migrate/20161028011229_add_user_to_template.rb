class AddUserToTemplate < ActiveRecord::Migration[5.0]
  def change
    add_reference :templates, :user, index: true
  end
end
