class Group < ActiveRecord::Base
  validates_uniqueness_of :title
  has_many :users
end
