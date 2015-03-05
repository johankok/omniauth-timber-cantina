require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class TimberCantina < OmniAuth::Strategies::OAuth2
      option :name, :timber_cantina

      option :client_options, {
        :site => "https://cantina.budh.nl",
        :authorize_url => "/oauth/authorize"
      }

      uid { raw_info["id"] }

      info do
        {
          :email => raw_info["email"]
          # and anything else you want to return to your API consumers
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me.json').parsed
      end
    end
  end
end