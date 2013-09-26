class City < ActiveRecord::Base
  has_many :news_locations, :class_name => 'Location'
  has_many :news, :through => :news_locations

  validates :name,
            :presence => true
end
