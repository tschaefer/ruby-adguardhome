# frozen_string_literal: true

module AdGuardHome
  module Safebrowsing
    class << self
      attr_writer :agent

      ##
      # Enable safebrowsing.
      def enable
        @agent.post('/safebrowsing/enable')
      end

      ##
      # Disable safebrowsing.
      def disable
        @agent.post('/safebrowsing/disable')
      end

      ##
      # Get safebrowsing status.
      def status
        @agent.get('/safebrowsing/status')
      end
    end
  end
end
