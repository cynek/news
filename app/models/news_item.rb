class NewsItem < ActiveRecord::Base
  ITEM_TYPES = {
    I18n.t('news_item_types.events')   => 1,
    I18n.t('news_item_types.activity') => 2
  }.freeze

  has_many :locations, :dependent => :destroy
  has_many :cities, :through => :locations

  scope :last, ->(count) { where(arel_table[:date].lt('NOW()')).order(:date => :desc).limit(count) }
  scope :will, where(arel_table[:date].gt('NOW()'))

  validates :title,
            :presence => true,
            :length => {:maximum => 255}
  validates :date,
            :presence => true
  validates :item_type,
            :inclusion => {:in => ITEM_TYPES.values}

  module Archive
    extend ActiveSupport::Concern

    included do
      base.class_eval do
        default_scope { where(:deleted_at => nil) }
      end
    end

    alias_method :destroy_full, :destroy
    def destroy
      run_callbacks :destroy do
        self.update_column(:deleted_at, Time.now.utc) rescue return nil
      end
    end

    def recover
      self.update_column(:deleted_at, nil)
    end
  end

  include Archive
end
