module DashboardHelper
  def get_prices_details_class_flags date, category
    if date.strftime('%A') == t('saturday') or date.strftime('%A') == t('sunday')
      return 'text-danger'
    end

    if category == Day::CATEGORY_HOLIDAY
      'text-danger'
    end
  end
end
