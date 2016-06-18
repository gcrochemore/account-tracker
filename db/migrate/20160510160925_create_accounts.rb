class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.references :owner, references: :user
      t.references :bank, references: :third_party
      t.float :initial_amount

      t.boolean :activated

      t.timestamps
    end
  end
end
