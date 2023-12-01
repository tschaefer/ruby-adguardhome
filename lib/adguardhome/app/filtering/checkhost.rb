# frozen_string_literal: true

require 'adguardhome/app/base'

module AdGuardHome
  module App
    module Filtering
      class CheckHostCommand < AdGuardHome::App::BaseCommand
        parameter 'NAME', 'name of the host to check', required: true

        def execute
          configure

          begin
            check = AdGuardHome.filtering.check_host(name: @name)
          rescue StandardError => e
            bailout(e.message)
          end

          if check['rule'].empty?
            puts 'Not filtered.'
            exit 1
          end

          puts "Filtered by rule #{check['rule']} (reason: #{check['reason']})."
          exit 0
        end
      end
    end
  end
end
