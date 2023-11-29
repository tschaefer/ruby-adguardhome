# frozen_string_literal: true

module AdGuardHome
  module Access
    class << self
      attr_writer :agent

      ##
      # List (dis)allowed clients, blocked hosts, etc.
      def list
        @agent.get('/access/list')
      end

      ##
      # Set (dis)allowed clients, blocked hosts, etc.
      #
      #   {
      #     allowed_clients: [
      #       '<string>'
      #       ],
      #     disallowed_clients: [
      #       '<string>'
      #     ],
      #     blocked_hosts: [
      #       '<string>'
      #     ]
      #   }
      def set(attributes)
        @agent.put('/access/set', params: { body: attributes.to_json })
      end
    end
  end
end
