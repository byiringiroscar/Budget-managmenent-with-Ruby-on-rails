class AddForeignKeyToSpends < ActiveRecord::Migration[7.0]
  def change
    add_column :spends, :category_id, :integer
    add_foreign_key :spends, :categories, column: :category_id
  end
end
