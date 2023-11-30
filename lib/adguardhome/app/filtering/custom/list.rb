# frozen_string_literal: true

require 'adguardhome/app/base'

module AdGuardHome
  module App
    module Filtering
      module Custom
        class ListCommand < AdGuardHome::App::BaseCommand
          def execute
            configure

            rules = AdGuardHome.filtering.status['user_rules']
            puts rules.join("\n") if rules.any?
          end
        end
      end
    end
  end
end
