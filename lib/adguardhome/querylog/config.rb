# frozen_string_literal: true

module AdGuardHome
  module Querylog
    class Config
      class << self
        attr_writer :agent

        ##
        # Get query log parameters.
        def get
          @agent.get('/querylog/config')
        end

        ##
        # Get query log parameters.
        #
        #   {
        #     enabled: '<boolean>',
        #     interval: '<integer>',
        #     anonymize_client_ip: '<boolean>'
        #     ignored: [
        #       '<string>'
        #     ]
        #   }
        def update(attributes)
          @agent.get('/querylog/config/update', params: { body: attributes })
        end

        ##
        # Set query log parameters.
        #
        #   {
        #     enabled: '<boolean>',
        #     interval: '<integer>',
        #     anonymize_client_ip: '<boolean>'
        #   }
        def set(attributes)
          @agent.post('/querylog/config', params: { body: attributes.to_json })
        end
      end
    end
  end
end
