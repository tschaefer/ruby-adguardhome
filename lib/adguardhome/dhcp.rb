# frozen_string_literal: true

require 'adguardhome/dhcp/lease'

module AdGuardHome
  module DHCP
    class << self
      attr_writer :agent

      ##
      # Gets the available interfaces.
      def interfaces
        @agent.get('/dhcp/interfaces')
      end

      ##
      # Updates the current DHCP server configuration.
      #
      #   {
      #     enabled: '<boolean>',
      #     interface_name: '<string>',
      #     v4: {
      #       gateway_ip: '<string>',
      #       subnet_mask: '<string>',
      #       range_start: '<string>',
      #       range_end: '<string>',
      #       lease_duration: '<integer>'
      #     },
      #     v6: {
      #       range_start: '<string>',
      #       lease_duration: '<integer>'
      #     }
      #   }
      def config(attributes)
        @agent.post('/dhcp/config', params: { body: attributes.to_json })
      end

      ##
      # Searches for an active DHCP server on the network.
      #
      #   {
      #     interface: '<string>',
      #   }
      def find_active_dhcp(attributes)
        @agent.post('/dhcp/find_active_dhcp', params: { body: attributes.to_json })
      end

      ##
      # Reset DHCP configuration.
      def reset
        @agent.post('/dhcp/reset')
      end

      ##
      # Reset DHCP leases.
      def reset_leases
        @agent.post('/dhcp/reset_leases')
      end

      ##
      # Gets the current DHCP settings and status.
      def status
        @agent.get('/dhcp/status')
      end

      def lease
        AdGuardHome::DHCP::Lease.agent = @agent

        AdGuardHome::DHCP::Lease
      end
    end
  end
end
