class Api::V1::TokensController < ApplicationController
  def create
    @user = User.find(params[:email])
    #User.authenticate (which exists thanks to the
    #gem bcrypt) with the password as a parameter
    if @user&.authenticate(params[:password])
      render json: {
        token: JsonWebToken.encode(user_id: @user.id),
        email: @user.email
      }
    else
      head :unauthorized
    end
  end

  private
  #only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
