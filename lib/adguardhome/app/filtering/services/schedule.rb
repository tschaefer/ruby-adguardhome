# frozen_string_literal: true

require 'adguardhome/app/base'
require 'adguardhome/app/filtering/services/schedule/show'

module AdGuardHome
  module App
    module Filtering
      module Services
        class ScheduleCommand < AdGuardHome::App::BaseCommand
          subcommand 'show', 'show pause schedule blocked services',
                     AdGuardHome::App::Filtering::Services::Schedule::ShowCommand
        end
      end
    end
  end
end
