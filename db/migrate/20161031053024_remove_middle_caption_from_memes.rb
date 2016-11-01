class RemoveMiddleCaptionFromMemes < ActiveRecord::Migration[5.0]
  def change
    remove_column :memes, :middle_caption, :string
  end
end
