class DaysController < ApplicationController
  before_action :set_day, only: [:show, :edit, :update, :destroy]

  def index
    @days = Day.all.order(data: :desc, id: :desc)
  end

  def show

  end

  def new
    @day = Day.new
    @vehicles = Vehicle.all
  end

  def create
    start_date = Date.strptime params[:day][:start_date], t('date_format')
    end_date = Date.strptime params[:day][:end_date], t('date_format')

    (start_date..end_date).each do |date|
      day = Day.new

      day.data = date.strftime t('date_format')
      day.categoria = params[:day][:categoria]

      if day.save
        params[:day][:vehicles].each do |v|
          day_vehicle = DaysVehicle.new

          day_vehicle.vehicle_id = v
          day_vehicle.day_id = day.id

          day_vehicle.save
        end
      end
    end

    redirect_to days_path, notice: t('save_success')
  end

  def edit
    @vehicles = Vehicle.all
  end

  def update
    if @day.update(day_params)
      DaysVehicle.where(day_id: @day.id).destroy_all

      params[:day][:vehicles].each do |v|
        day_vehicle = DaysVehicle.new

        day_vehicle.vehicle_id = v
        day_vehicle.day_id = @day.id

        day_vehicle.save
      end

      redirect_to days_path, notice: t('save_success')
    end
  end

  def destroy
    @day.destroy
    respond_to do |format|
      format.html {redirect_to days_path, notice: t('delete_success')}
      format.json {head :no_content}
    end
  end

  def self.get_day_category date, vehicle
    day = DaysVehicle.joins(:day).where(days: {data: date}, vehicle_id: vehicle.id).last

    if day
      day.day.categoria
    else
      if date.strftime('%A') == I18n.t('saturday') or date.strftime('%A') == I18n.t('sunday') or date.strftime('%A') == I18n.t('friday')
        return Day::CATEGORY_PEAK
      else
        return Day::CATEGORY_VALLEY
      end
    end
  end

  private

  def day_params
    params.require(:day).permit(:data, :categoria)
  end

  def set_day
    @day = Day.find(params[:id])
  end
end
