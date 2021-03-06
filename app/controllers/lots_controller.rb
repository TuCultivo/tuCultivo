class LotsController < ApplicationController
  require 'json'
  protect_from_forgery with: :null_session
  before_action :authenticate_user!,except: [:get_info]
  before_action :set_lot, only: [:show, :edit, :update, :destroy,:get_info]
  before_action :set_farm, only: [:new,:index,:edit,:update]
  
  # GET /lots
  # GET /lots.json
  def index
    @lots = @farm.lots
  end

  # GET /lots/1
  # GET /lots/1.json
  def show
  end

  # GET /lots/new
  def new
    @lot = Lot.new
  end

  # GET /lots/1/edit
  def edit
  end

  # POST /lots
  # POST /lots.json
  def create
    @lot = Lot.new(lot_params)
    loop do
      @lot.key = ([*('a'..'z'),*('A'..'Z'),*('0'..'9')]-%w()).sample(8).join
      break unless Lot.exists?(key: @lot.key)
    end

    respond_to do |format|
      if @lot.save
        format.html { redirect_to farm_lots_path, notice: 'Lote creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @lot }
      else
        format.html { render :new }
        format.json { render json: @lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lots/1
  # PATCH/PUT /lots/1.json
  def update
    respond_to do |format|
      if @lot.update(lot_params)
        format.html { redirect_to farm_lots_path, notice: 'Lote actualizado satisfactoriamente' }
        format.json { render :show, status: :ok, location: @lot }
      else
        format.html { render :edit }
        format.json { render json: @lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lots/1
  # DELETE /lots/1.json
  def destroy
    @lot.destroy
    p "destroy"
    respond_to do |format|
      format.html { redirect_to farm_lots_url, notice: 'Lot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST '/lots/1/get_info'
  def get_info
  
    grooves = Groove.select(:id,:quantity).where(lot_id:@lot.id)
    info = ["farm_id":@lot.farm_id]
    info.append(grooves)
    
    respond_to do |format|
      format.json {render json: info.to_json}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lot
      @lot = Lot.find(params[:id])
    end

    def set_farm
      @farm = Farm.find(params[:farm_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lot_params
      params.require(:lot).permit(:name, :location, :farm_id)
    end
end
