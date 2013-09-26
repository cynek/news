class Location < ActiveRecord::Base
  belongs_to :city
  belongs_to :news_item

  validates :lat,
            :presence => true
  validates :lng,
            :presence => true
  validates :news_item,
            :associated => true
end
