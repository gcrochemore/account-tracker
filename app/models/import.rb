class Import < ActiveRecord::Base
  attr_accessible :file, :name, :id, :created_at, :updated_at, :account_id, :activated

  validates :name, presence: :true
end
