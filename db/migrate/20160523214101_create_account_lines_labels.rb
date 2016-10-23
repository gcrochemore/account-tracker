class CreateAccountLinesLabels < ActiveRecord::Migration
  def change
    create_table :account_lines_labels do |t|
      t.references :account_line
      t.references :label
      
      t.boolean :activated

      t.timestamps
    end
  end
end
