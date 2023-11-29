# frozen_string_literal: true

require 'adguardhome/stats/config'

module AdGuardHome
  module Stats
    class << self
      attr_writer :agent

      ##
      # Get DNS server statistics.
      def get
        @agent.get('/stats')
      end

      ##
      # Reset all statistics to zero.
      def reset
        @agent.post('/stats/reset')
      end

      ##
      # Get statistics parameters.
      def info
        @agent.get('/stats_info')
      end

      def config
        AdGuardHome::Stats::Config.agent = @agent
        AdGuardHome::Stats::Config
      end
    end
  end
end
