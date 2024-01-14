# frozen_string_literal: true

require 'adguardhome/app/base'
require 'adguardhome/app/mixin/table'

module AdGuardHome
  module App
    module Stats
      class BaseCommand < AdGuardHome::App::BaseCommand
        include AdGuardHome::App::Mixin::Table

        option ['-a', '--all'], :flag, 'show all'
        option '--[no-]legend', :flag, 'do not print a legend.', default: true
        option '--[no-]pager', :flag, 'do not pipe output into a pager.', default: true

        def execute
          stats, queries = object { fetch }

          header, rows = body(stats, queries)
          message = "#{queries} total queries."
          output = "#{render(header, rows)}#{legend(message)}"
          pager(output)

          exit 0
        end

        private

        def body(stats, queries)
          header = [@header] + %w[QUERIES PROPORTION]
          rows = stats.map do |object|
            percentage = percentage(object.values.first, queries)
            [object.keys.first, object.values.first, "#{percentage}%"]
          end

          [header, rows]
        end

        def fetch
          stats = AdGuardHome.stats.get

          objects = stats[@stats]
          objects = objects[0..9] if !all? && objects.size > 10

          [objects, stats['num_dns_queries']]
        end

        def percentage(value, total)
          (value / total.to_f * 100).round(2)
        end
      end
    end
  end
end
