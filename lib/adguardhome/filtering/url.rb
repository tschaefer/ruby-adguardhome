# frozen_string_literal: true

module AdGuardHome
  module Filtering
    module URL
      class << self
        attr_writer :agent

        ##
        # Add filter URL or an absolute file path.
        #
        #   {
        #     name: '<string>',
        #     url: '<string>',
        #     whitelist: '<boolean>',
        #   }
        def add(attributes)
          @agent.post('/filtering/add_url', params: { body: attributes.to_json })
        end

        ##
        # Remove filter URL.
        #
        #   {
        #     url: '<string>',
        #     whitelist: '<boolean>',
        #   }
        def remove(attributes)
          @agent.post('/filtering/remove_url', params: { body: attributes.to_json })
        end

        ##
        # Set URL parameters.
        #
        #   {
        #     data: {
        #       enabled: '<boolean>',
        #       name: '<string>',
        #       url: '<string>'
        #     },
        #     url: '<string>',
        #     whitelist: '<boolean>'
        #   }
        def set(attributes)
          @agent.post('/filtering/set_url', params: { body: attributes.to_json })
        end
      end
    end
  end
end
