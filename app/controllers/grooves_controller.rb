class GroovesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_groofe, only: [:show, :edit, :update, :destroy]
  before_action :set_lot, only: [:new,:index, :edit]
  # GET /grooves
  # GET /grooves.json
  def index
    @grooves = Groove.where(lot_id: @lot.id)
    grooves_n = @grooves.count
    @show_lot = false
    data = []
    
    @grooves.each_with_index do |groove,i|
      if groove.plague_reports.present?
        @show_lot = true
        sick_plants = groove.plague_reports.last.sick_plants.pluck(:location)
        (0..groove.quantity-1).each do |j|
          if sick_plants.include?(j)
            data.push([j,i,1])  
          else
            data.push([j,i,0])
          end
        end
      end
    end
    gon.heatline_data = data
  end
  # GET /grooves/1
  # GET /grooves/1.json
  def show
  end

  # GET /grooves/new
  def new
    @groofe = Groove.new
  end

  # GET /grooves/1/edit
  def edit
  end

  # POST /grooves
  # POST /grooves.json
  def create
    @groofe = Groove.new(groofe_params)

    respond_to do |format|
      if @groofe.save
        format.html { redirect_to  farm_lot_grooves_path, notice: 'El Surco fue creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @groofe }
      else
        format.html { render :new }
        format.json { render json: @groofe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grooves/1
  # PATCH/PUT /grooves/1.json
  def update
    respond_to do |format|
      if @groofe.update(groofe_params)
        format.html { redirect_to farm_lot_grooves_path, notice: 'El Surco fue actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @groofe }
      else
        format.html { render :edit }
        format.json { render json: @groofe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grooves/1
  # DELETE /grooves/1.json
  def destroy
    @groofe.destroy
    respond_to do |format|
      format.html { redirect_to farm_lot_grooves_url, notice: 'Groove was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_groofe
      @groofe = Groove.find(params[:id])
    end

    def set_lot
      @lot = Lot.find(params[:lot_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def groofe_params
      params.require(:groofe).permit(:quantity, :lot_id)
    end
end
