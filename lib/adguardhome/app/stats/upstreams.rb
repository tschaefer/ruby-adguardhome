# frozen_string_literal: true

require 'adguardhome/app/stats/base'

module AdGuardHome
  module App
    module Stats
      class UpstreamsCommand < AdGuardHome::App::Stats::BaseCommand
        private

        def body(stats, _queries)
          header = ['UPSTREAM', 'RESPONSES', 'AVERAGE TIME']
          rows = stats.map do |object|
            values = object.values.flatten
            [object.keys.first, values.first, "#{values.last.round(3)} s"]
          end

          [header, rows]
        end

        def fetch # rubocop:disable Metrics/AbcSize
          stats = AdGuardHome.stats.get

          resp = stats['top_upstreams_responses']
          avg = stats['top_upstreams_avg_time']

          objects = []
          resp.each do |r|
            key = r.keys.first
            values = r.values + avg.find { |a| a.keys.first == key }.values

            objects << { key => values }
          end

          [objects, stats['num_dns_queries']]
        end
      end
    end
  end
end
