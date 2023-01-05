class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  before_action :check_login, only: [:create]
  before_action :check_owner, only: [:update, :destroy]

  def index
    render json: product_serialize(Product.all)
  end

  def show
    render json: product_serialize(@product)
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: product_serialize(@product), status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render json: product_serialize(@product)
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    head 204
  end


  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :price, :published)
  end

  def check_owner
    head :forbidden unless @product.user_id == current_user&.id
  end

  def product_serialize product
    ProductSerializer.new(product).serializable_hash
  end
end
