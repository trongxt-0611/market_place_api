module Authenticable
  def current_user
    return @current_user if @current_user

    header = request.headers['Authorization']
    return nill if header.blank?

    decoded = JsonWebToken.decode(header)
    @current_user = User.find(decoded[:user_id]) rescue ActiveRecord::RecordNotFound
  end
end

#include this module to application_controller
