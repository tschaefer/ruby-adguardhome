# frozen_string_literal: true

module AdGuardHome
  module Parental
    class << self
      attr_writer :agent

      ##
      # Enable parental filtering.
      def enable
        @agent.post('/parental/enable')
      end

      ##
      # Disable parental filtering.
      def disable
        @agent.post('/parental/disable')
      end

      ##
      # Get parental filtering status.
      def status
        @agent.get('/parental/status')
      end
    end
  end
end
