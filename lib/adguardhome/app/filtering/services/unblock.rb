# frozen_string_literal: true

require 'adguardhome/app/base'

module AdGuardHome
  module App
    module Filtering
      module Services
        class UnblockCommand < AdGuardHome::App::BaseCommand
          parameter 'SERVICE', 'service to unblock', required: true

          def execute
            configure

            bailout('Service not found.') if !available?
            unblock

            exit 0
          end

          private

          def services
            return @services if @services

            @services = request(:all)['blocked_services']
          end

          def available?
            services.any? { |s| s['name'] == service }
          end

          def unblock
            id = services.find { |s| s['name'] == service }['id']
            payload = request(:get)
            payload['ids'].delete(id)

            request(:update, payload)
          end

          def request(method, *args)
            AdGuardHome.blocked_services.send(method, *args)
          rescue StandardError => e
            bailout(e.message)
          end
        end
      end
    end
  end
end
