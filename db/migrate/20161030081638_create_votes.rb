class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :user, foreign_key: true
      t.references :meme, foreign_key: true
      t.boolean :value

      t.timestamps
    end

    add_index :votes, [:user_id, :meme_id], :unique => true
    
  end
end
