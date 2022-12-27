class JsonWebToken
  #create secrect key constant
  SECRECT_KEY = Rails.application.secrets.secret_key_base.to_s

  class << self
    #encode function
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, SECRECT_KEY)
    end

    #decode function
    def decode token
      decoded = JWT.decode(token, SECRECT_KEY).first
      HashWithIndifferentAccess.new decoded
    end

  end

end

# In order to load the file into our application, you must
# specify the lib folder in the list of Ruby on Rails _autoload_s.
#add the following configuration to the application.rb
