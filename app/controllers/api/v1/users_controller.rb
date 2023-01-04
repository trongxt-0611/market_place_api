class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: %i[show update destroy]
  before_action :check_owner, only: %i[update destroy]
  #GET /users/1
  def show
    render json: @user
  end

  #GET /users
  def index
    render json: User.all
  end


  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    if @user.destroy
      render json: @user, status: :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def check_owner
    head :forbidden unless current_user&.id == @user.id
  end
end
