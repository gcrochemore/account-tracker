class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.string :name
      t.references :account
      t.binary :file

      t.boolean :activated

      t.timestamps
    end
  end
end
