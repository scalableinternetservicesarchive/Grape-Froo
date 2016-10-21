class AddIndexToTemplate < ActiveRecord::Migration[5.0]
  def change
    add_index :templates, :name, unique: true
  end
end
