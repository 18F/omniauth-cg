require 'bundler/setup'
require 'omniauth-cg'
require './app.rb'

use Rack::Session::Cookie, secret: 'secret'

# Get app_id and app_secret from the OAuth Provider.
#
# to set up a dummy app that points to a dev/staging version of cloud.gov, add:
#     :client_options => {
#       :site => 'http://example.com',
#       :token_url => '/oauth/token'
#     }
# to `provider :cg ...`
#
# Uncomment the following line with the url of this dummy app.
# OmniAuth.config.full_host = "http://dummy.example.com"
#
# To run the app, simply call `rackup` from the command line. If you would like to run as
# a daemon, call `rackup -D` ... if you do this, you should set up logging.

use OmniAuth::Builder do
  provider :cg, ENV['APP_ID'], ENV['APP_SECRET']
end

run Sinatra::Application
