# frozen_string_literal: true

module AdGuardHome
  module Stats
    module Config
      class << self
        attr_writer :agent

        ##
        # Get statistics parameters.
        def get
          @agent.get('/stats/config')
        end

        ##
        # Set statistics parameters.
        #
        #   {
        #     interval: '<integer>',
        #   }
        def set(attributes)
          @agent.post('/stats_config', params: { body: attributes.to_json })
        end

        ##
        # Update statistics parameters.
        #
        #   {
        #     enabled: '<boolean>',
        #     interval: '<integer>',
        #     ignored: [
        #       '<string>'
        #     ]
        #   }
        def update(attributes)
          @agent.put('/stats/config/update', params: { body: attributes.to_json })
        end
      end
    end
  end
end
