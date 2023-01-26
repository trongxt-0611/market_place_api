class Api::V1::TokensController < ApplicationController
  def create
    @user = User.find_by_email(user_params[:email])
    #User.authenticate (which exists thanks to the
    #gem bcrypt) with the password as a parameter
    if @user&.authenticate(user_params[:password])
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
