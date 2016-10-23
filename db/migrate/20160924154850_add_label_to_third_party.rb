class AddLabelToThirdParty < ActiveRecord::Migration
  def change
    change_table :third_parties do |t|
      t.references :label
    end
  end
end
