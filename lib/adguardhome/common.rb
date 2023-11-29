# frozen_string_literal: true

module AdGuardHome
  module Common
    class << self
      attr_writer :agent

      ##
      # Get DNS server current status and general settings.
      def status
        @agent.get('/status')
      end

      ##
      # Set protection state and duration.
      #
      #   {
      #     enabled: '<boolean>',
      #     duration: '<integer>'
      #   }
      def protection(attributes)
        @agent.post('/protection', params: { body: attributes.to_json })
      end

      ##
      # Gets information about the latest available version of AdGuard.
      #
      #   {
      #   recheck_now: '<boolean>'
      #   }
      def version(attributes)
        @agent.post('/version', params: { body: attributes.to_json })
      end

      ##
      # Begin auto-upgrade procedure.
      def update
        @agent.post('/update')
      end
    end
  end
end
