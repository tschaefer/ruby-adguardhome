# frozen_string_literal: true

require 'adguardhome/app/base'
require 'adguardhome/app/filtering/custom'

module AdGuardHome
  module App
    class FilteringCommand < AdGuardHome::App::BaseCommand
      subcommand 'custom', 'custom filtering', AdGuardHome::App::Filtering::CustomCommand
    end
  end
end
