# frozen_string_literal: true

module AdGuardHome
  module Clients
    class << self
      attr_writer :agent

      ##
      # Add a new client.
      #
      #   {
      #     name: '<string>',
      #     ids: [
      #       '<string>'
      #     ],
      #     use_global_settings: '<boolean>',
      #     filtering_enabled: '<boolean>',
      #     parental_enabled: '<boolean>',
      #     safebrowsing_enabled: '<boolean>',
      #     safesearch_enabled: '<boolean>',
      #     safe_search: {
      #       enabled: '<boolean>',
      #       bing: '<boolean>',
      #       duckduckgo: '<boolean>',
      #       google: '<boolean>',
      #       pixabay: '<boolean>',
      #       yandex: '<boolean>',
      #       youtube: '<boolean>'
      #     },
      #     use_global_blocked_services: '<boolean>',
      #     blocked_services_schedule: {
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
      #     blocked_services: [
      #       '<string>'
      #     ],
      #     upstreams: [
      #       '<string>'
      #     ],
      #     tags: [
      #       '<string>'
      #     ],
      #     ignore_querylog: '<boolean>',
      #     ignore_statistics: '<boolean>',
      #     upstreams_cache_enabled: '<boolean>',
      #     upstreams_cache_size: '<boolean>'
      #   }
      def add(attributes)
        @agent.post('/clients/add', params: { body: attributes.to_json })
      end

      ##
      # Delete a client.
      #
      #   {
      #     name: '<string>'
      #   }
      def delete(attributes)
        @agent.delete('/clients/delete', params: { body: attributes.to_json })
      end

      ##
      # Get information about clients by their IP addresses.
      #   {
      #     ip0: '<string>',
      #     ip1: '<string>'
      #     ...
      #   }
      def find(attributes)
        @agent.get('/clients/find', params: { query: attributes })
      end

      ##
      # Get information about configured clients.
      def get
        @agent.get('/clients')
      end

      ##
      # Update client information.
      #
      #   {
      #     name: '<string>',
      #     ids: [
      #       '<string>'
      #     ],
      #     use_global_settings: '<boolean>',
      #     filtering_enabled: '<boolean>',
      #     parental_enabled: '<boolean>',
      #     safebrowsing_enabled: '<boolean>',
      #     safesearch_enabled: '<boolean>',
      #     safe_search: {
      #       enabled: '<boolean>',
      #       bing: '<boolean>',
      #       duckduckgo: '<boolean>',
      #       google: '<boolean>',
      #       pixabay: '<boolean>',
      #       yandex: '<boolean>',
      #       youtube: '<boolean>'
      #     },
      #     use_global_blocked_services: '<boolean>',
      #     blocked_services_schedule: {
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
      #     blocked_services: [
      #       '<string>'
      #     ],
      #     upstreams: [
      #       '<string>'
      #     ],
      #     tags: [
      #       '<string>'
      #     ],
      #     ignore_querylog: '<boolean>',
      #     ignore_statistics: '<boolean>',
      #     upstreams_cache_enabled: '<boolean>',
      #     upstreams_cache_size: '<boolean>'
      #   }
      def update(attributes)
        @agent.post('/clients/update', params: { body: attributes.to_json })
      end
    end
  end
end
