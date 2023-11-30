# frozen_string_literal: true

module AdGuardHome
  module BlockedServices
    class << self
      attr_writer :agent

      ##
      # Get available services to use for blocking.
      def all
        @agent.get('/blocked_services/all')
      end

      ##
      # Get blocked services.
      def get
        @agent.get('/blocked_services/get')
      end

      ##
      # Get blocked services list.
      def list
        @agent.get('/blocked_services/list')
      end

      ##
      # Set blocked services list.
      #   [
      #     '<string>'
      #   ]
      def set(attributes)
        @agent.post('/blocked_services/set', params: { body: attributes.to_json })
      end

      ##
      # Get available services to use for blocking.
      def services
        @agent.get('/blocked_services/services')
      end

      ##
      # Update blocked services.
      #
      #   {
      #     schedule: {
      #       time_zone: '<string>',
      #       sun: {
      #         start: '<number>',
      #         end: '<number>'
      #       },
      #       mon: {
      #         start: '<number>',
      #         end: '<number>'
      #       },
      #       tue: {
      #         start: '<number>',
      #         end: '<number>'
      #       },
      #       wed: {
      #         start: '<number>',
      #         end: '<number>'
      #       },
      #       thu: {
      #         start: '<number>',
      #         end: '<number>'
      #       },
      #       fri: {
      #         start: '<number>',
      #         end: '<number>'
      #       },
      #       sat: {
      #         start: '<number>',
      #         end: '<number>'
      #       }
      #     },
      #     ids: [
      #       '<string>',
      #       '<string>'
      #     ]
      #   }
      def update(attributes)
        @agent.put('/blocked_services/update', params: { body: attributes.to_json })
      end
    end
  end
end
