# frozen_string_literal: true

require 'tty-pager'
require 'tty-table'

require 'adguardhome/app/base'

module AdGuardHome
  module App
    module Stats
      class BaseCommand < AdGuardHome::App::BaseCommand
        option ['-a', '--all'], :flag, 'show all'
        option '--[no-]legend', :flag, 'do not print a legend.', default: true
        option '--[no-]pager', :flag, 'do not pipe output into a pager.', default: true

        def execute
          configure

          begin
            stats = AdGuardHome.stats.get
          rescue StandardError => e
            bailout(e.message)
          end

          output = "#{render_table(stats)}#{legend(stats)}"
          TTY::Pager.new(enabled: pager?).page(output)

          exit 0
        end

        def render_table(stats) # rubocop:disable Metrics/AbcSize
          objects = objects(stats)

          header = [@header] + %w[QUERIES PROPORTION]
          rows = objects.map do |object|
            percentage = percentage(object.values.first, stats['num_dns_queries'])
            [object.keys.first, object.values.first, "#{percentage}%"]
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

        def objects(stats)
          objects = stats[@stats]
          objects = objects[0..9] if !all? && objects.size > 10

          objects
        end

        def legend(stats)
          return "\n" if !legend?

          total = stats['num_dns_queries']
          "\n\n#{total} total queries.\n"
        end

        def percentage(value, total)
          (value / total.to_f * 100).round(2)
        end
      end
    end
  end
end
