class Api::V1::OrdersController < ApplicationController
  before_action :check_login, only: %i[index show create]

  def index
    render json: OrderSerializer.new(current_user.orders).serializable_hash
  end

  def show
    order = current_user.orders.find(params[:id])
    if order
      options = {include: [:product]}
      render json: serialize(order, options)
    else
      head 404
    end
  end

  def create
    order = current_user.orders.build(order_params)
    if order.save
      OrderMailer.send_confirmation(order).deliver
      render json: order, status: 201
    else
      render json: {errors: order.errors}, status:422
    end
  end

  private
  def order_params
    params.require(:order).permit(:total, :product_ids: [])
  end
  def serialize(order, options = {})
    OrderSerializer.new(order, options).serializable_hash
  end
end