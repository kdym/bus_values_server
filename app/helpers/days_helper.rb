module DaysHelper
  def get_class_flags day
    if day.strftime('%A') == t('saturday') or day.strftime('%A') == t('sunday')
      'text-danger'
    end
  end

  def get_class_flags_with_categories day, category
    if day.strftime('%A') == t('saturday') or day.strftime('%A') == t('sunday')
      return 'text-danger'
    end

    if category == Day::CATEGORY_HOLIDAY
      'text-danger'
    end
  end

  def get_vehicles_in_date day
    day.days_vehicles.map do |dv|
      dv.vehicle.nome
    end
  end

  def get_checked_vehicles day, vehicle_id
    checked = false

    if params[:id]
      day.days_vehicles.each do |dv|
        if dv.vehicle_id == vehicle_id
          return checked = true
        end
      end
    end
  end
end
