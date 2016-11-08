class AddAttachmentImageToMemes < ActiveRecord::Migration[5.0]
  def self.up
    change_table :memes do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :memes, :image
  end
end
