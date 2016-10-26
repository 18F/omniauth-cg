require 'omniauth-oauth2'
require 'jwt'

module OmniAuth
  module Strategies
    class Cg < OmniAuth::Strategies::OAuth2
      option :name, 'cg'

      # URLs provided by cloud.gov here:
      # https://docs.cloud.gov/apps/leveraging-authentication/
      option :token_params, grant_type: 'authorization_code', response_type: 'token'

      # These are called after authentication has succeeded. If possible, you should try
      # to set the UID without making additional calls (if the user id is returned with
      # the token or as a URI parameter). This may not be possible with all providers.
      uid {
        raw_info['user_id']
      }

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
        @raw_info ||= JWT.decode(access_token.to_hash[:access_token], nil, false)[0]
      end
    end
  end
end
