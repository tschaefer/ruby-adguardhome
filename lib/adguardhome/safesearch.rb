# frozen_string_literal: true

module AdGuardHome
  module Safesearch
    class << self
      attr_writer :agent

      ##
      # Enable safesearch.
      def enable
        @agent.post('/safesearch/enable')
      end

      ##
      # Disable safesearch.
      def disable
        @agent.post('/safesearch/disable')
      end

      ##
      # Update safesearch settings.
      #
      #   {
      #     enabled: '<boolean>',
      #     bing: '<boolean>',
      #     duckduckgo: '<boolean>',
      #     google: '<boolean>',
      #     pixabay: '<boolean>',
      #     yandesx: '<boolean>',
      #     youtube: '<boolean>'
      #   }
      def settings(attributes)
        @agent.put('/safesearch/settings', params: { body: attributes.to_json })
      end

      ##
      # Get safesearch status.
      def status
        @agent.get('/safesearch/status')
      end
    end
  end
end
