class AccountLine < ActiveRecord::Base
  attr_accessible :name, :third_party, :third_party_id, :amount, :transaction_date, :debit_date, :source_account_id, 
    :target_account_id, :account_id, :label_id, :activated, :id, :created_at, :updated_at
  belongs_to :account
  belongs_to :target_account, class_name: 'Account'
  belongs_to :source_account, class_name: 'Account'
  belongs_to :third_party
  belongs_to :label

  default_scope order('debit_date DESC')

  self.per_page = 20
end
