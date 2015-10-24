class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings
  has_many :levelings, as: :levelable
  has_many :levels, through: :levelings
end
