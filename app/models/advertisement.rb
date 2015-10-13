class Advertisement < ActiveRecord::Base
  has_many :copies
  has_many :prices
end
