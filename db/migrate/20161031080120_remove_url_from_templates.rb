class RemoveUrlFromTemplates < ActiveRecord::Migration[5.0]
  def change
    remove_column :templates, :url, :string
  end
end
