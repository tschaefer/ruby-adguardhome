# frozen_string_literal: true

module AdGuardHome
  module DHCP
    module Lease
      class << self
        attr_writer :agent

        ##
        # Adds static lease.
        #
        #   {
        #     mac: '<string>',
        #     ip: '<string>',
        #     hostname: '<string>',
        #   }
        def add(attributes)
          @agent.post('/dhcp/add_static_lease', params: { body: attributes.to_json })
        end

        ##
        # Removes static lease.
        #
        #   {
        #     mac: '<string>',
        #     ip: '<string>',
        #     hostname: '<string>',
        #   }
        def remove(attributes)
          @agent.post('/dhcp/remove_static_lease', params: { body: attributes.to_json })
        end

        ##
        # Updates static lease.
        #
        #   {
        #     mac: '<string>',
        #     ip: '<string>',
        #     hostname: '<string>',
        #   }
        def update(attributes)
          @agent.post('/dhcp/update_static_lease', params: { body: attributes.to_json })
        end
      end
    end
  end
end
