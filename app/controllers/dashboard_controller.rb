class DashboardController < ApplicationController
  def index
    @start_date = Date.today

    if params[:start_date]
      @start_date = params[:start_date].to_date
    end

    if params[:date]
      @start_date = params[:date].to_date
    end

    @end_date = @start_date + 7.days

    @vehicles = Vehicle.all

    @days_categories = {}

    @vehicles.each do |v|
      (@start_date..@end_date).to_a.each do |date|
        @days_categories[v.id] ||= {}
        @days_categories[v.id][date] = DaysController.get_day_category date, v
      end
    end
  end
end
