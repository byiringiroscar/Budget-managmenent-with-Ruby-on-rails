class RenameAuthorIdColumnInEntities < ActiveRecord::Migration[7.0]
  def change
    rename_column :entities, :author_id_id, :author_id
  end
end
