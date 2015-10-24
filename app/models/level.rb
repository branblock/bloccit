class Level < ActiveRecord::Base

  enum severity: [ :PG, :PG13, :R]

  has_many :levelings
  belongs_to :levelable, polymorphic: true
  has_many :topics, through: :levelings, source: :levelable, source_type: :Topic
  has_many :posts, through: :levelings, source: :levelable, source_type: :Post

  def self.update_levels(level_string)
    new_levels = []
    unless level_string.nil? || level_string.empty?
      level_string.split(",").each do |level|
      level_name = level.strip
      new_level = Level.find_or_create_by(name: level_name)
      new_levels << new_level
      end
    end
  new_levels
  end
end
