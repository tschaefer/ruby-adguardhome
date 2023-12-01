# frozen_string_literal: true

require 'adguardhome/app/base'
require 'adguardhome/app/filtering/custom'
require 'adguardhome/app/filtering/checkhost'

module AdGuardHome
  module App
    class FilteringCommand < AdGuardHome::App::BaseCommand
      subcommand 'custom', 'custom filtering rules', AdGuardHome::App::Filtering::CustomCommand
      subcommand 'checkhost', 'check if host is filtered', AdGuardHome::App::Filtering::CheckHostCommand
    end
  end
end
