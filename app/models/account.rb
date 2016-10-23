class Account < ActiveRecord::Base
  attr_accessible :name, :owner_id, :bank_id, :activated, :account_lines_attributes, :initial_amount, :debits_attributes, :credits_attributes

  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :bank, class_name: 'ThirdParty', foreign_key: 'bank_id'
  has_many :debits, class_name: 'AccountLine', foreign_key: 'source_account_id'
  has_many :credits, class_name: 'AccountLine', foreign_key: 'target_account_id'
  accepts_nested_attributes_for :debits, allow_destroy: true
  accepts_nested_attributes_for :credits, allow_destroy: true
  
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def balance
    (debits.sum(:amount).nil? || credits.sum(:amount).nil? || self.initial_amount.nil?)? 0 : round(self.initial_amount - debits.sum(:amount) + credits.sum(:amount))
  end
  
  def round(number,precision=2)
    ("%01.#{precision}f" %number).to_f
  end

  def all_lines
    AccountLine.where('source_account_id = ? OR target_account_id = ?', id, id).order(:debit_date)
  end
end
