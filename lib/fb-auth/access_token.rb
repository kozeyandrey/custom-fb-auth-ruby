require 'json'

module FbAuth
  class AccessToken
    class NoAuthorizationCodeError < StandardError; end
    def initialize(app_id: nil, app_secret: nil)
      @connection = Faraday.new(url: "https://graph.facebook.com/#{FB_API_VERSION}/")
      @app_id = app_id
      @app_secret = app_secret
    end

    def access_token
      response = @connection.get '/oauth/access_token', { client_id: @app_id, client_secret: @app_secret,
                                                         grant_type: 'client_credentials'
      }

      data = JSON.parse(response.body)

      if data['error']
        p(data['error'])

        raise NoAuthorizationCodeError, 'Something went wrong, please try to sign up/login in a usual way'
      else
        data['access_token']
      end
    end

  end
end