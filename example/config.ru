require 'bundler/setup'
require 'omniauth-cg'
require './app.rb'

use Rack::Session::Cookie, secret: 'secret'

OmniAuth.config.full_host = 'http://localhost:9292'

# To run the app, simply call `rackup` from the command line. If you would like to run as
# a daemon, call `rackup -D` ... if you do this, you should set up logging.

use OmniAuth::Builder do
  provider :cg, ENV['APP_ID'], ENV['APP_SECRET']
end

run Sinatra::Application
