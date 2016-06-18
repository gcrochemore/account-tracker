class ThirdParty < ActiveRecord::Base
  attr_accessible :name, :parent_id
  belongs_to :parent, class_name: 'ThirdParty', foreign_key: 'parent_id'
end
