require 'json'

module FbAuth
  class User
    def initialize(access_token: nil, user_id: nil)
      @connection = Faraday.new(url: "https://graph.facebook.com/#{FB_API_VERSION}/")
      @access_token = access_token
      @user_id = user_id
    end

    def id
      response = @connection.get @user_id.to_s, { fields: 'first_name,last_name', access_token: @access_token }

      JSON.parse(response.body)
    end
  end
end
