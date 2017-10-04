class Price < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  belongs_to :vehicle

  MIN_HOURS = 3
  MAX_HOURS = 10

  def formatted_valor
    number_to_currency self[:valor], precision: 2, unit: I18n.t('currency.symbol'), separator: I18n.t('currency.decimal'), delimiter: I18n.t('currency.thousands')
  end

  def valor=(valor)
    self[:valor] = valor.gsub(I18n.t('currency.thousands'), '').gsub(I18n.t('currency.symbol'), '')
  end
end
