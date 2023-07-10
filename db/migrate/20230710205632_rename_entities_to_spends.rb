class RenameEntitiesToSpends < ActiveRecord::Migration[7.0]
  def change
    rename_table :entities, :spends
  end
end
