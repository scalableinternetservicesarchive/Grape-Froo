class AlterColumnVotesValue < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      change_table :votes do |t|
        dir.up { t.change :value, :integer }
        dir.down { t.change :value, :boolean }
      end
    end
  end
end
