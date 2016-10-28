class CreateMemes < ActiveRecord::Migration[5.0]
  def change
    create_table :memes do |t|
      t.string :url
      t.string :top_caption
      t.string :middle_caption
      t.string :bottom_caption
      t.references :template, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
