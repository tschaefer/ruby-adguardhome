# frozen_string_literal: true

require 'adguardhome/app/base'
require 'adguardhome/app/filtering'
require 'adguardhome/app/stats'

module AdGuardHome
  module App
    class Command < AdGuardHome::App::BaseCommand
      subcommand 'stats', 'show stats', AdGuardHome::App::StatsCommand
      subcommand 'filtering', 'filtering', AdGuardHome::App::FilteringCommand
    end
  end
end
