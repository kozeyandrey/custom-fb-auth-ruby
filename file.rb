require './lib/fb-auth.rb'

obj = FbAuth::AccessToken.new(app_id: ENV['APP_ID'], app_secret: ENV['APP_SECRET'])
access_token = obj.access_token

user = FbAuth::User.new(access_token: access_token, user_id: ENV['USER_ID'])

p user.id