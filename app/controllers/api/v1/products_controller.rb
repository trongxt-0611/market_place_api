class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  before_action :check_login, only: [:create]
  before_action :check_owner, only: [:update, :destroy]
  include Paginable

  def index
    @products = Product.page(current_page)
                       .per(per_page)
                       .search(params)

    options = {
      links:{
        first: api_v1_products_path(page: 1),
        last: api_v1_products_path(page: @products.total_pages),
        prev: api_v1_products_path(page: @products.prev_page),
        next: api_v1_products_path(page: @products.next_page),
      }
    }
    render json: product_serialize(@products, options)
  end

  def show
    options = {include: [:user]}
    render json: product_serialize(@product, options)
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
    params.require(:product).permit(:title, :price, :published, :user_id)
  end

  def check_owner
    head :forbidden unless @product.user_id == current_user&.id
  end

  def product_serialize(product, options = {})
    ProductSerializer.new(product, options).serializable_hash
  end
end
