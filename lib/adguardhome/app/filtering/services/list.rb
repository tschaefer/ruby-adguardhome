# frozen_string_literal: true

require 'tty-screen'
require 'tty-pager'
require 'tty-table'

require 'adguardhome/app/base'

module AdGuardHome
  module App
    module Filtering
      module Services
        class ListCommand < AdGuardHome::App::BaseCommand
          option ['-b', '--blocked'], :flag, 'show only blocked services'
          option '--[no-]legend', :flag, 'do not print a legend.', default: true
          option '--[no-]pager', :flag, 'do not pipe output into a pager.', default: true

          def execute
            configure

            begin
              all = AdGuardHome.blocked_services.all['blocked_services']
              blocked = AdGuardHome.blocked_services.list
            rescue StandardError => e
              bailout(e.message)
            end

            services = services(all, blocked)
            if services.empty?
              puts 'No services found.'
              exit 0
            end

            output = "#{render_table(services)}#{legend(all, blocked)}"
            pager(output)

            exit 0
          end

          private

          def legend(all, blocked)
            return "\n" if !legend?

            "\n\n#{all.size} total services, #{blocked.size} blocked services.\n"
          end

          def pager(content)
            enabled = pager?

            if pager? &&
               (content.lines.size <= TTY::Screen.height &&
                content.lines.map(&:size).max <= TTY::Screen.width)
              enabled = false
            end

            TTY::Pager.new(enabled:).page(content)
          end

          def services(all, blocked)
            all.each do |service|
              service['blocked'] = blocked.include?(service['id'])
            end

            all.select! { |service| service['blocked'] } if blocked?

            all
          end

          def render_table(services)
            header = %w[NAME blocked]
            rows = services.map do |service|
              [service['name'], service['blocked'] ? 'yes' : 'no']
            end
            table = TTY::Table.new(header:, rows:)

            table.render(multiline: true, width: 2**16) do |renderer|
              renderer.border do
                mid '─'
                mid_mid '─'
                center ' '
              end
            end
          end
        end
      end
    end
  end
end
