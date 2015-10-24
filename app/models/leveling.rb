class Leveling < ActiveRecord::Base
  belongs_to :levelable, polymorphic: true
  belongs_to :level
end
