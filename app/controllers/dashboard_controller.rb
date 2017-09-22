class DashboardController < ApplicationController
  def index
    @vehicles = Vehicle.all.order(nome: :asc)
  end

  def calculate_prices
    vehicle = Vehicle.find(params[:vehicle])
    @prices = PricesController.calculate_prices params[:start_date], params[:end_date], vehicle, params[:hours]

    render layout: false
  end

  def load_dates
    @vehicles = Vehicle.all.order(nome: :asc)

    @start_date = params[:start_date].to_date
    @end_date = @start_date + 7.days

    @vehicles = Vehicle.all

    @days_categories = {}

    @vehicles.each do |v|
      (@start_date..@end_date).to_a.each do |date|
        @days_categories[v.id] ||= {}
        @days_categories[v.id][date] = DaysController.get_day_category date, v
      end
    end

    render layout: false
  end
end
