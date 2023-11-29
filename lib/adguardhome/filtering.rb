# frozen_string_literal: true

require 'adguardhome/filtering/url'

module AdGuardHome
  module Filtering
    class << self
      attr_writer :agent

      ##
      # Get filtering status.
      def status
        @agent.get('/filtering/status')
      end

      ##
      # Set filtering parameters.
      #
      #   {
      #     enabled: '<boolean>',
      #     interval: '<integer>',
      #   }
      def config(attributes)
        @agent.get('/filtering/config', params: { body: attributes.to_json })
      end

      ##
      # Reload filtering rules from URLs. This might be needed if new URL was
      # just added and you don't want to wait for automatic refresh to kick in.
      # This API request is rate limited, so you can't call it freely as often
      # as you like, it wonn't create unnecessary burd.
      #
      #   {
      #     whitelist: '<boolean>',
      #   }
      def refresh(attributes)
        @agent.post('/filtering/refresh', params: { body: attributes.to_json })
      end

      ##
      # Set user-defined filter rules.
      #
      #   {
      #     rules: [
      #       '<string>'
      #     ]
      #   }
      def set_rules(attributes) # rubocop:disable Naming/AccessorMethodName
        @agent.post('/filtering/set_rules', params: { body: attributes.to_json })
      end

      ##
      # Check if host name is filtered.
      #
      #   {
      #     name: '<string>',
      #   }
      def check_host(attributes)
        @agent.get('/filtering/check_host', params: { query: attributes })
      end

      def url
        AdGuardHome::Filtering::URL.agent = @agent
        AdGuardHome::Filtering::URL
      end
    end
  end
end
