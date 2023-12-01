# frozen_string_literal: true

require 'adguardhome/app/base'

module AdGuardHome
  module App
    module Filtering
      module Custom
        class RemoveCommand < AdGuardHome::App::BaseCommand
          parameter 'RULE ...', 'custom filtering rule', attribute_name: :rules

          def execute
            configure

            begin
              rules = AdGuardHome.filtering.status['user_rules']
              rules -= @rules

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
