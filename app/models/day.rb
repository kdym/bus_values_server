class Day < ApplicationRecord
  CATEGORY_SUMMER = 'S'
  CATEGORY_VALLEY = 'V'
  CATEGORY_PEAK = 'P'
  CATEGORY_HOLIDAY = 'H'

  def self.categories
    {
        self::CATEGORY_SUMMER => 'Summer',
        self::CATEGORY_VALLEY => 'Valley',
        self::CATEGORY_PEAK => 'Peak',
        self::CATEGORY_HOLIDAY => 'Holiday',
    }
  end

  has_many :days_vehicles

  def data
    self[:data].strftime I18n.t('date_format')
  end

  def data=(date)
    self[:data] = Date.strptime date, I18n.t('date_format')
  end
end
