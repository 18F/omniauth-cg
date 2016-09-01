require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Cg < OmniAuth::Strategies::OAuth2
      option :name, 'cg'

      # URLs provided by cloud.gov here:
      # https://docs.cloud.gov/apps/leveraging-authentication/
      option :client_options, site: 'https://login.cloud.gov/oauth/authorize', token_url: 'https://uaa.cloud.gov/oauth/token'

      # These are called after authentication has succeeded. If possible, you should try
      # to set the UID without making additional calls (if the user id is returned with
      # the token or as a URI parameter). This may not be possible with all providers.
      uid { raw_info['uid'] }

      info do
        {
          email: raw_info['email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/profile').parsed
      end
    end
  end
end
