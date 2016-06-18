class CreateImportLines < ActiveRecord::Migration
  def change
    create_table :import_lines do |t|
      t.string :name
      t.references :import
      t.string :data
      t.references :account_line

      t.boolean :activated

      t.timestamps
    end
  end
end
