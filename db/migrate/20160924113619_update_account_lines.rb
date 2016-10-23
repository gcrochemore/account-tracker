class UpdateAccountLines < ActiveRecord::Migration
  def change
    change_table :account_lines do |t|
      t.references :target_account, references: :accounts
      t.references :source_account, references: :accounts
    end
  end
end
