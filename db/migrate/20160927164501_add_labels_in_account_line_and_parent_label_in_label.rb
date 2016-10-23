class AddLabelsInAccountLineAndParentLabelInLabel < ActiveRecord::Migration
  def change
    change_table :labels do |t|
      t.references :parent_label, references: :labels
    end
    change_table :account_lines do |t|
      t.references :label
    end
  end
end
