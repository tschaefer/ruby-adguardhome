# frozen_string_literal: true

require 'adguardhome/app/base'
require 'adguardhome/app/mixin/table'

module AdGuardHome
  module App
    module Filtering
      module Services
        module Schedule
          class ShowCommand < AdGuardHome::App::BaseCommand
            include AdGuardHome::App::Mixin::Table

            option '--[no-]legend', :flag, 'do not print a legend.', default: true
            option '--[no-]pager', :flag, 'do not pipe output into a pager.', default: true

            def execute
              schedule = object { AdGuardHome.blocked_services.get['schedule'] }
              if schedule['ids'].nil? || schedule['ids'].empty?
                puts 'No schedule found.'
                exit 0
              end

              time_zone = schedule.delete('time_zone')
              header, rows = body(schedule)
              table = "#{render(header, rows)}#{legend("Current time zone #{time_zone}")}"
              pager(table)

              exit 0
            end

            private

            def msec_to_hm(msec)
              sec = msec / 1000
              format('%<hour>02d:%<minute>02d', hour: sec / 3600, minute: sec / 60 % 60)
            end

            def body(schedule)
              rows = []
              schedule.each_key do |day|
                rows << [
                  day.capitalize,
                  msec_to_hm(schedule[day]['start']),
                  msec_to_hm(schedule[day]['end'])
                ]
              end

              [%w[DAY START END], rows]
            end
          end
        end
      end
    end
  end
end
