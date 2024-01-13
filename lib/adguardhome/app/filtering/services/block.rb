# frozen_string_literal: true

require 'adguardhome/app/base'

module AdGuardHome
  module App
    module Filtering
      module Services
        class BlockCommand < AdGuardHome::App::BaseCommand
          parameter 'SERVICE', 'service to block', required: true

          def execute
            configure

            bailout('Service not found.') if !available?
            block

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

          def block
            id = services.find { |s| s['name'] == service }['id']
            payload = request(:get)
            payload['ids'] << id
            payload['ids'].uniq!

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
