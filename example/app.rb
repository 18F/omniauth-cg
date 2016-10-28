require 'sinatra'
require 'sinatra/reloader'
require 'yaml'

set :run, false
set :raise_errors, true

get '/' do
  headers \
    'Access-Control-Allow-Origin' => '*',
    'Access-Control-Allow-Credentials' => 'true'

  content_type 'text/html'
  <<-END
<html>
  <body>
    <link href='//fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <link href='//s3.amazonaws.com/myusa-static/button.min.css' rel='stylesheet' type='text/css'>
    <p>
      <a href="https://login.cloud.gov/oauth/authorize?client_id=#{ENV.fetch('APP_ID')}&response_type=code" class="btn btn-social btn-myusa">Connect with Cloud.gov</a>
    </p>
  </body>
</html>
  END
end

get '/auth/cg/callback' do
  content_type 'application/json'
  MultiJson.encode(request.env)
  headers \
    'Access-Control-Allow-Origin' => '*',
    'Access-Control-Allow-Credentials' => 'true'
end

get '/auth/failure' do
  content_type 'application/json'
  MultiJson.encode(request.env)
end
