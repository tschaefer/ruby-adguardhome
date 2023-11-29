# frozen_string_literal: true

module AdGuardHome
  module Apple
    module Mobileconfig
      class << self
        attr_writer :agent

        ##
        # Get DNS over HTTPS mobileconfig.
        #
        #   {
        #     host: '<string>',
        #     client_id: '<string>',
        #   }
        def doh(attributes)
          @agent.get('/apple/doh.mobileconfig', params: { query: attributes })
        end

        ##
        # Get DNS over TLS mobileconfig.
        #
        #   {
        #     host: '<string>',
        #     client_id: '<string>',
        #   }
        def dot(attributes)
          @agent.get('/apple/dot.mobileconfig', params: { query: attributes })
        end
      end
    end
  end
end
