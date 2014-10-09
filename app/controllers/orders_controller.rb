class OrdersController < ApplicationController
#  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def sales
    @orders = Order.where(seller: current_user).order("created_at desc")
  end

  def purchases
    @orders = Order.where(buyer: current_user).order("created_at desc")
  end

  # GET /orders/new
  def new
    @order = Order.new
    @roasting = Roasting.find(params[:roasting_id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @roasting = Roasting.find(params[:roasting_id])
    @seller = @roasting.user

    @order.roasting_id = @roasting.id
    @order.buyer_id = current_user.id
    @order.seller_id = @seller.id

    respond_to do |format|
      if @order.save
        format.html { redirect_to root_url, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # # Use callbacks to share common setup or constraints between actions.
    # def set_order
    #   @order = Order.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:address, :city, :state)
    end
end
