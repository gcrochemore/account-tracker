class Label < ActiveRecord::Base
  scope :without_parent, -> {where(parent_label_id: nil)}
  attr_accessible :name, :parent_label_id, :id, :created_at, :updated_at, :activated
  default_scope order(:name)
  belongs_to :parent, class_name: 'Label', foreign_key: 'parent_label_id'
  has_many :children, class_name: 'Label', foreign_key: 'parent_label_id'

  def all_lines(page)
    AccountLine.where('third_party_id IN (SELECT id from third_parties where label_id = ?)', id).order(:debit_date).page(page)
  end

  def prix_total
    AccountLine.where('third_party_id IN (SELECT id from third_parties where label_id = ?)', id).sum(:amount)
  end

  def prix_total_filtre(search, account)
    AccountLine.search(search).result.where('target_account_id = ? AND (label_id = ? OR label_id IN (SELECT id from labels where parent_label_id = ?))', account, id, id).sum(:amount) - AccountLine.search(search).result.where('source_account_id = ? AND (label_id = ? OR label_id IN (SELECT id from labels where parent_label_id = ?))', account, id, id).sum(:amount)    
  end
end