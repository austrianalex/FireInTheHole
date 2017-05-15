class User < ActiveRecord::Base
  validates_uniqueness_of :username
  belongs_to :group
  has_many :locations
  
end
