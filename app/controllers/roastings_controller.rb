class RoastingsController < ApplicationController
  before_action :set_roasting, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: :index
  before_filter :check_user, only: [:edit, :update, :destroy]

  def seller
    @roastings = Roasting.where(user: current_user).order("created_at desc")
  end

  # GET /roastings
  # GET /roastings.json
  def index
    @roastings = Roasting.all.order("created_at desc")
  end

  # GET /roastings/1
  # GET /roastings/1.json
  def show
  end

  # GET /roastings/new
  def new
    @roasting = Roasting.new
  end

  # GET /roastings/1/edit
  def edit
  end

  # POST /roastings
  # POST /roastings.json
  def create
    @roasting = Roasting.new(roasting_params)
    @roasting.user_id = current_user.id

    respond_to do |format|
      if @roasting.save
        format.html { redirect_to @roasting, notice: 'Roasting was successfully created.' }
        format.json { render :show, status: :created, location: @roasting }
      else
        format.html { render :new }
        format.json { render json: @roasting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roastings/1
  # PATCH/PUT /roastings/1.json
  def update
    respond_to do |format|
      if @roasting.update(roasting_params)
        format.html { redirect_to @roasting, notice: 'Roasting was successfully updated.' }
        format.json { render :show, status: :ok, location: @roasting }
      else
        format.html { render :edit }
        format.json { render json: @roasting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roastings/1
  # DELETE /roastings/1.json
  def destroy
    @roasting.destroy
    respond_to do |format|
      format.html { redirect_to roastings_url, notice: 'Roasting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roasting
      @roasting = Roasting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roasting_params
      params.require(:roasting).permit(:name, :description, :price, :image)
    end

    def check_user
      if current_user.id != @roasting.user_id
        redirect_to root_url, alert: "This listing belogs to somewhere else"
      end
    end
end
