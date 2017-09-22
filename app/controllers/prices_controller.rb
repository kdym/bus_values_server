class PricesController < ApplicationController
  before_action :set_vehicle, only: [:index, :edit, :update]

  # GET /prices
  # GET /prices.json
  def index
    query = Price.where(vehicle_id: @vehicle.id)

    @prices = {}
    query.each do |p|
      @prices[p.horas] ||= {}
      @prices[p.horas][p.categoria] = p.valor
    end
  end

  # GET /prices/1
  # GET /prices/1.json
  def show
  end

  # GET /prices/new
  def new
    @price = Price.new
  end

  # GET /prices/1/edit
  def edit
    query = Price.where(vehicle_id: @vehicle.id)

    @prices = {}
    query.each do |p|
      @prices[p.horas] ||= {}
      @prices[p.horas][p.categoria] = p.valor
    end
  end

  # POST /prices
  # POST /prices.json
  def create
    @price = Price.new(price_params)

    respond_to do |format|
      if @price.save
        format.html {redirect_to @price, notice: 'Price was successfully created.'}
        format.json {render :show, status: :created, location: @price}
      else
        format.html {render :new}
        format.json {render json: @price.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /prices/1
  # PATCH/PUT /prices/1.json
  def update
    params[:values].each do |hour, v|
      v.each do |category, v2|
        price = Price.where(vehicle_id: @vehicle.id, horas: hour, categoria: category).first_or_create

        price.valor = v2
        price.categoria = category
        price.horas = hour
        price.vehicle_id = @vehicle.id

        price.save
      end
    end

    respond_to do |format|
      format.html {redirect_to prices_path(@vehicle), notice: t('save_success')}
    end
  end

  # DELETE /prices/1
  # DELETE /prices/1.json
  def destroy
    @price.destroy
    respond_to do |format|
      format.html {redirect_to prices_url, notice: 'Price was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  def self.calculate_prices start_date, end_date, vehicle, hours
    start_date = Date.strptime start_date, I18n.t('date_format')
    end_date = Date.strptime end_date, I18n.t('date_format')

    (start_date..end_date).map do |date|
      category = DaysController.get_day_category date, vehicle
      price = Price.where(vehicle_id: vehicle.id, categoria: category, horas: hours).first

      {date: date, category: category, price: (price) ? price.valor : 0}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_price
    @price = Price.find(params[:id])
  end

  def set_vehicle
    @vehicle = Vehicle.find(params[:vehicle])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def price_params
    params.require(:price).permit(:valor, :categoria, :horas, :vehicle_id)
  end
end
