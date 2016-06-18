class CreateAccountLines < ActiveRecord::Migration
  def change
    create_table :account_lines do |t|
      t.string :name
      t.references :account
      t.datetime :transaction_date      
      t.datetime :debit_date
      t.references :third_party
      t.float :amount

      t.boolean :activated

      t.timestamps
    end
  end
end
