class AccountLine < ActiveRecord::Base
  attr_accessible :name, :third_party_id, :amount, :transaction_date, :debit_date
  belongs_to :account
  belongs_to :third_party

  default_scope order('debit_date DESC')
end
