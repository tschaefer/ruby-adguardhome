# frozen_string_literal: true

require 'adguardhome/app/base'

module AdGuardHome
  module App
    module Filtering
      module Custom
        class AddCommand < AdGuardHome::App::BaseCommand
          parameter 'RULE', 'add custom filter rule'

          def execute
            configure

            begin
              rules = AdGuardHome.filtering.status['user_rules']
              rules << rule
              rules.uniq!

              AdGuardHome.filtering.set_rules(rules:)
            rescue StandardError => e
              bailout(e.message)
            end
          end
        end
      end
    end
  end
end
