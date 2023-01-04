class Api::V1::ProductsController < ApplicationController\
  before_actions :find_product

  def index
    @products = Product.all
  end

  def show
    render json: @product
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end
end
