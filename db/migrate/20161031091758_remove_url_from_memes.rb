class RemoveUrlFromMemes < ActiveRecord::Migration[5.0]
  def change
    remove_column :memes, :url, :string
  end
end
