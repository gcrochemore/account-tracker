class ThirdParty < ActiveRecord::Base
  attr_accessible :name, :parent_id, :label_id, :merge_id, :id, :created_at, :updated_at, :owner_id, :activated
  attr_accessor :merge_id
  belongs_to :parent, class_name: 'ThirdParty', foreign_key: 'parent_id'
  belongs_to :label
  default_scope order(:name)

  def all_lines(page)
    AccountLine.where('third_party_id = ?', id).order(:debit_date).page(page)
  end

  def prix_total
    AccountLine.where('third_party_id = ?', id).sum(:amount)
  end
end
