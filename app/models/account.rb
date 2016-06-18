class Account < ActiveRecord::Base
  attr_accessible :name, :owner_id, :bank_id, :activated, :account_lines_attributes, :initial_amount

  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :bank, class_name: 'ThirdParty', foreign_key: 'bank_id'
  has_many :account_lines
  accepts_nested_attributes_for :account_lines, allow_destroy: true
  
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def balance
    round(self.initial_amount + account_lines.sum(:amount))
  end
  
  def round(number,precision=2)
    ("%01.#{precision}f" %number).to_f
  end
end
