class SurfSpotsController < ApplicationController
  before_action :set_surf_spot, only: %i[ show edit update destroy ]

  # GET /surf_spots or /surf_spots.json
  def index
    @surf_spots = SurfSpot.all
  end

  # GET /surf_spots/1 or /surf_spots/1.json
  def show
  end

  # GET /surf_spots/new
  def new
    @surf_spot = SurfSpot.new
  end

  # GET /surf_spots/1/edit
  def edit
  end

  # POST /surf_spots or /surf_spots.json
  def create
    @surf_spot = SurfSpot.new(surf_spot_params)

    respond_to do |format|
      if @surf_spot.save
        format.html { redirect_to @surf_spot, notice: "Surf spot was successfully created." }
        format.json { render :show, status: :created, location: @surf_spot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @surf_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surf_spots/1 or /surf_spots/1.json
  def update
    respond_to do |format|
      if @surf_spot.update(surf_spot_params)
        format.html { redirect_to @surf_spot, notice: "Surf spot was successfully updated." }
        format.json { render :show, status: :ok, location: @surf_spot }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @surf_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surf_spots/1 or /surf_spots/1.json
  def destroy
    @surf_spot.destroy!

    respond_to do |format|
      format.html { redirect_to surf_spots_path, status: :see_other, notice: "Surf spot was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_surf_spot
      @surf_spot = SurfSpot.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def surf_spot_params
      params.expect(surf_spot: [ :name, :location, :country, :description, :wave_type, :break_type, :optimal_swell_direction, :optimal_wind_direction, :best_tide, :difficulty_level, :crowd_level, :localism_level, :monthly_cost, :rental_cost, :lesson_cost ])
    end
end
