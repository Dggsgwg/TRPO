class TravelsController < ApplicationController
  before_action :set_travel, only: %i[ show edit update destroy ]
  before_action :store_user_location!, if: :storable_location?

  # GET /travels or /travels.json
  def index
    @travels = Travel.where(is_approved: true)

    @travels = @travels.where(departure_point: params[:departure_point]) unless params[:departure_point].nil? or empty?
    @travels = @travels.where(destination: params[:destination]) unless params[:destination].nil? or empty?
    @travels = @travels.where(date: params[:date]) unless params[:date].nil? or empty?
  end

  # GET /travels/search
  def search
  end

  # GET /travels/1 or /travels/1.json
  def show
  end

  # GET /travels/new
  def new
    authenticate_user! unless user_signed_in?
    @travel = Travel.new
  end

  # GET /travels/1/edit
  def edit
  end

  # POST /travels or /travels.json
  def create
    @travel = Travel.new(travel_params)

    respond_to do |format|
      if @travel.save
        format.html { redirect_to travel_url(@travel), notice: "Travel was successfully created." }
        format.json { render :show, status: :created, location: @travel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @travel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travels/1 or /travels/1.json
  def update
    respond_to do |format|
      if @travel.update(travel_params)
        format.html { redirect_to travel_url(@travel), notice: "Travel was successfully updated." }
        format.json { render :show, status: :ok, location: @travel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @travel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travels/1 or /travels/1.json
  def destroy
    @travel.destroy!

    respond_to do |format|
      format.html { redirect_to travels_url, notice: "Travel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel
      @travel = Travel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def travel_params
      authenticate_user! unless user_signed_in?
      params.require(:travel).permit(:departure_point, :destination, :price, :date, :phone_number, :is_approved, :user_id)
            .with_defaults(is_approved: false, user_id: current_user.id)
    end


  def storable_location?
    request.get? &&
      is_navigational_format? &&
      !devise_controller? &&
      !request.xhr?
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope)
  end
end
