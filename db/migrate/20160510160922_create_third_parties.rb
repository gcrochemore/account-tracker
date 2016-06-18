class CreateThirdParties < ActiveRecord::Migration
  def change
    create_table :third_parties do |t|
      t.string :name
      t.references :owner, references: :user
      t.references :parent, references: :third_party

      t.boolean :activated

      t.timestamps
    end
  end
end