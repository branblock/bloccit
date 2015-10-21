class Rate < ActiveRecord::Base
  enum severity: [:PG, :PG13, :R]
  has_many :ratings
  belongs_to :rateable, polymorphic: true
  has_many :topics, through: :ratings, source: :rateable, source_type: :Topic
  has_many :posts, through: :ratings, source: :rateable, source_type: :Post
end

#def self.update_rating(rating_string)
#  new_rates = []
#  unless rating_string.nil? || rating_string.empty?
#    rate_string.split(",").each do |label|
#    rate_name = label.strip
#    new_label = Label.find_or_create_by(name: label_name)
#    new_labels << new_label
#    end
#  end
#  new_labels
#end
end
