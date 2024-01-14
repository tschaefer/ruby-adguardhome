# frozen_string_literal: true

require 'tty-screen'
require 'tty-pager'
require 'tty-table'

require 'adguardhome/app/base'
require 'adguardhome/app/mixin/table'

module AdGuardHome
  module App
    module Filtering
      module Services
        class ListCommand < AdGuardHome::App::BaseCommand
          include AdGuardHome::App::Mixin::Table

          option ['-b', '--blocked'], :flag, 'show only blocked services'
          option '--[no-]legend', :flag, 'do not print a legend.', default: true
          option '--[no-]pager', :flag, 'do not pipe output into a pager.', default: true

          def execute
            configure

            services, blocked = object { fetch }
            if services.empty?
              puts 'No services found.'
              exit 0
            end

            header, rows = body(services)
            desc = "#{services.size} total services, #{blocked.size} blocked services."
            output = "#{render(header, rows)}#{legend(desc)}"
            pager(output)

            exit 0
          end

          private

          def fetch
            all = AdGuardHome.blocked_services.all['blocked_services']
            blocked = AdGuardHome.blocked_services.list

            all.each do |service|
              service['blocked'] = blocked.include?(service['id'])
            end

            all.select! { |service| service['blocked'] } if blocked?

            [all, blocked]
          end

          def body(services)
            header = %w[NAME BLOCKED]
            rows = services.map do |service|
              [service['name'], service['blocked'] ? 'yes' : 'no']
            end

            [header, rows]
          end
        end
      end
    end
  end
end
