# frozen_string_literal: true

module AdGuardHome
  module TLS
    class << self
      attr_writer :agent

      ##
      # Updates current TLS configuration.
      #
      #   {
      #     enabled: '<boolean>',
      #     server_name: '<string>',
      #     force_https: '<boolean>',
      #     port_https: '<integer>',
      #     port_dns_over_tls: '<integer>',
      #     port_dns_over_quic: '<integer>',
      #     certificate_chain: '<string>',
      #     private_key: '<string>',
      #     private_key_saved: '<boolean>',
      #     certificate_path: '<string>',
      #     private_key_path: '<string>',
      #     valid_cert: '<boolean>',
      #     valid_chain: '<boolean>',
      #     subject: '<string>',
      #     issuer: '<string>',
      #     not_before: '<string>',
      #     not_after: '<string>',
      #     dns_names: [
      #       '<string>'
      #     ],
      #     valid_key: '<boolean>',
      #     key_type: RSA,
      #     warning_validation: '<string>',
      #     valid_pair: '<boolean>'
      #   }
      def configure(attributes)
        @agent.put('/tls', params: { body: attributes.to_json })
      end

      ##
      # Returns TLS configuration and status.
      def status
        @agent.get('/tls/status')
      end

      ##
      # Checks if the current TLS configuration is valid.
      #
      #   {
      #     enabled: '<boolean>',
      #     server_name: '<string>',
      #     force_https: '<boolean>',
      #     port_https: '<integer>',
      #     port_dns_over_tls: '<integer>',
      #     port_dns_over_quic: '<integer>',
      #     certificate_chain: '<string>',
      #     private_key: '<string>',
      #     private_key_saved: '<boolean>',
      #     certificate_path: '<string>',
      #     private_key_path: '<string>',
      #     valid_cert: '<boolean>',
      #     valid_chain: '<boolean>',
      #     subject: '<string>',
      #     issuer: '<string>',
      #     not_before: '<string>',
      #     not_after: '<string>',
      #     dns_names: [
      #       '<string>'
      #     ],
      #     valid_key: '<boolean>',
      #     key_type: RSA,
      #     warning_validation: '<string>',
      #     valid_pair: '<boolean>'
      #   }
      def validate(attributes)
        @agent.post('/tls/validate', params: { body: attributes.to_json })
      end
    end
  end
end
