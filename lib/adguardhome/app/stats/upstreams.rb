# frozen_string_literal: true

require 'adguardhome/app/stats/base'

module AdGuardHome
  module App
    module Stats
      class UpstreamsCommand < AdGuardHome::App::Stats::BaseCommand
        def render_table(stats) # rubocop:disable Metrics/AbcSize
          objects = objects(stats)

          header = ['UPSTREAM', 'RESPONSES', 'AVERAGE TIME']
          rows = objects.map do |object|
            values = object.values.flatten
            [object.keys.first, values.first, "#{values.last.round(3)} s"]
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
          resp = stats['top_upstreams_responses']
          avg = stats['top_upstreams_avg_time']

          objects = []
          resp.each do |r|
            key = r.keys.first
            values = r.values + avg.find { |a| a.keys.first == key }.values

            objects << { key => values }
          end

          objects
        end
      end
    end
  end
end
