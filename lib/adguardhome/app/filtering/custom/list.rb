# frozen_string_literal: true

require 'adguardhome/app/base'

module AdGuardHome
  module App
    module Filtering
      module Custom
        class ListCommand < AdGuardHome::App::BaseCommand
          def execute
            configure

            begin
              rules = AdGuardHome.filtering.status['user_rules']
              puts rules.join("\n") if rules.any?
            rescue StandardError => e
              bailout(e.message)
            end
          end
        end
      end
    end
  end
end
