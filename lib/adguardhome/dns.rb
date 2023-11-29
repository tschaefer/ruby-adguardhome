# frozen_string_literal: true

module AdGuardHome
  module DNS
    class << self
      attr_writer :agent

      ##
      # Get general DNS parameters.
      def info
        @agent.get('/dns_info')
      end

      ##
      # Set general DNS parameters.
      #
      #   {
      #     bootstrap_dns: [
      #       '<string>'
      #     ],
      #     upstream_dns: [
      #       '<string>'
      #     ],
      #     fallback_dns: [
      #       '<string>'
      #     ],
      #     upstream_dns_file: '<string>',
      #     protection_enabled: '<boolean>',
      #     ratelimit: '<integer>',
      #     ratelimit_subnet_subnet_len_ipv4: '<integer>',
      #     ratelimit_subnet_subnet_len_ipv6: '<integer>',
      #     ratelimit_whitelist: [
      #       '<string>'
      #     ],
      #     blocking_mode: custom_ip,
      #     blocking_ipv4: '<string>',
      #     blocking_ipv6: '<string>',
      #     blocked_response_ttl: '<integer>',
      #     protection_disabled_until: '<string>',
      #     edns_cs_enabled: '<boolean>',
      #     edns_cs_use_custom: '<boolean>',
      #     edns_cs_custom_ip: '<string>',
      #     disable_ipv6: '<boolean>',
      #     dnssec_enabled: '<boolean>',
      #     cache_size: '<integer>',
      #     cache_ttl_min: '<integer>',
      #     cache_ttl_max: '<integer>',
      #     cache_optimistic: '<boolean>',
      #     upstream_mode: ,
      #     use_private_ptr_resolvers: '<boolean>',
      #     resolve_clients: '<boolean>',
      #     local_ptr_upstreams: [
      #       '<string>'
      #     ]
      #   }
      def config(attributes)
        @agent.post('/dns_config', params: { body: attributes.to_json })
      end

      ##
      # Clear DNS cache.
      def clear_cache
        @agent.post('/cache_clear')
      end

      ##
      # Test DNS configuration.
      #
      #   {
      #     bootstrap_dns: [
      #       '<string>'
      #     ],
      #     upstream_dns: [
      #       '<string>'
      #     ],
      #     fallback_dns: [
      #       '<string>'
      #     ],
      #     private_upstream: [
      #       '<string>'
      #     ]
      #   }
      def test(attributes)
        @agent.post('/test_upstream_dns', params: { body: attributes.to_json })
      end
    end
  end
end
