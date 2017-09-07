require "gemstash"

module Gemstash
  # Class that contains endpoints to manage authorizations entries as an API.
  # Equivalent functionality of "gemstash authorize" on CLI
  module Authorize
    class RackMiddleware
      def initialize(app)
        @app = app
      end

      def call(env)

      end

      # TODO: review cli/authorize.rb, expose various methods from there as rack routes, all authenticated with the "keys" permission

    private

      def protected(servable)
        authorization.protect(self) { servable.serve(self) }
      end

      def authorization
        Gemstash::ApiKeyAuthorization
      end

      def check_auth
        @auth.check("keys")
      end
    end
  end
end 
