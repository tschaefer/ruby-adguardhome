# frozen_string_literal: true

require 'adguardhome/querylog/config'

module AdGuardHome
  module Querylog
    class << self
      attr_writer :agent

      ##
      # Get DNS server query log.
      #
      #   {
      #     older_than: '<string>',
      #     offset: '<integer>',
      #     limit: '<integer>',
      #     search: '<string>',
      #     response_status: all
      #   }
      def get(attributes = nil)
        @agent.get('/querylog', params: { query: attributes })
      end

      ##
      # Get query log parameters.
      def info
        @agent.get('/querylog_info')
      end

      ##
      # Clear query log.
      def clear
        @agent.delete('/querylog_clear')
      end

      def config
        AdGuardHome::Querylog::Config.agent = @agent

        AdGuardHome::Querylog::Config
      end
    end
  end
end
