class Import < ActiveRecord::Base
  attr_accessible :file, :name

  validates :name, presence: :true
end
