# frozen_string_literal: true

require 'adguardhome/app/base'

module AdGuardHome
  module App
    module Stats
      class GeneralCommand < AdGuardHome::App::BaseCommand
        def execute
          configure

          begin
            stats = AdGuardHome.stats.get
          rescue StandardError => e
            bailout(e.message)
          end

          puts "DNS Queries: #{stats['num_dns_queries']}"

          percentage = percentage(stats['num_blocked_filtering'], stats['num_dns_queries'])
          puts "Blocked by Filters: #{stats['num_blocked_filtering']} #{percentage}%"

          puts "Avg Processing Time: #{stats['avg_processing_time'].round(3)}s"

          exit 0
        end

        def percentage(value, total)
          (value / total.to_f * 100).round(2)
        end
      end
    end
  end
end
