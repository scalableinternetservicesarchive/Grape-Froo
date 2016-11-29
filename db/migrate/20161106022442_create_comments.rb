class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :message
      t.references :user, foreign_key: true
      t.references :meme, foreign_key: true
      t.references :parent, foreign_key: {to_table: :comments}

      t.timestamps
    end
  end
end
