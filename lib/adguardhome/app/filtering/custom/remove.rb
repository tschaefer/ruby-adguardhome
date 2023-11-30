# frozen_string_literal: true

require 'adguardhome/app/base'

module AdGuardHome
  module App
    module Filtering
      module Custom
        class RemoveCommand < AdGuardHome::App::BaseCommand
          parameter 'RULE', 'remove custom filter rule'

          def execute
            configure

            rules = AdGuardHome.filtering.status['user_rules']
            rules.delete(rule)

            AdGuardHome.filtering.set_rules(rules:)
          end
        end
      end
    end
  end
end
